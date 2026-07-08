/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Cap.PartitionFromMEC
import Erdos9796Proof.P97.CGN.CGN4g
import Erdos9796Proof.P97.CircumscribedMECPacket
import Erdos9796Proof.P97.WitnessPacketInterface
import Erdos9796Proof.P97.N8.FourSubpacket
import Erdos9796Proof.P97.N8.N8CapCoordNorm
import Erdos9796Proof.P97.U2.OneHitBound
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

/-- Every indexed cap of a surplus packet has the ordered-cap data supplied by
the CGN4g support-cap theorem.  This exports the existing support-cap result
through the cyclic packet API used by the erased-pin ordered scaffold. -/
theorem capByIndex_cgn4g_capData
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) :
    ∃ m, ∃ L : Problem97.CGN.OrderedCap m,
      ∃ Packet : Problem97.CGN.MecCapPacket A L,
      ∃ _ : Problem97.CGN.MinorCapSideHypotheses Packet,
      ∃ _ : Problem97.CGN.StrictCapOrder A L,
        Finset.univ.image L.points = S.capByIndex i := by
  fin_cases i
  · exact Problem97.CGN.CGN4g_capData_of_supportCap
      (A := A) (C := S.capByIndex 0) (M := S.triangleByIndex 0)
      hconv S.hncol (S.capByIndex_subset 0)
      (S.capByIndex_arc_membership 0)
      (S.triangleByIndex_v2_mem_capByIndex 0)
      (S.triangleByIndex_v3_mem_capByIndex 0)
      (by simpa [triangleByIndex] using S.circPacket)
      (by simpa [triangleByIndex] using S.circPacket.inner_at_v1)
  · exact Problem97.CGN.CGN4g_capData_of_supportCap
      (A := A) (C := S.capByIndex 1) (M := S.triangleByIndex 1)
      hconv S.hncol (S.capByIndex_subset 1)
      (S.capByIndex_arc_membership 1)
      (S.triangleByIndex_v2_mem_capByIndex 1)
      (S.triangleByIndex_v3_mem_capByIndex 1)
      S.circPacket2
      (by simpa [triangleByIndex] using S.circPacket2.inner_at_v1)
  · exact Problem97.CGN.CGN4g_capData_of_supportCap
      (A := A) (C := S.capByIndex 2) (M := S.triangleByIndex 2)
      hconv S.hncol (S.capByIndex_subset 2)
      (S.capByIndex_arc_membership 2)
      (S.triangleByIndex_v2_mem_capByIndex 2)
      (S.triangleByIndex_v3_mem_capByIndex 2)
      S.circPacket3
      (by simpa [triangleByIndex] using S.circPacket3.inner_at_v1)

/-- Every indexed cap of a surplus packet has the retained global block data
supplied by the CGN4g support-cap theorem.  This is the packet-level export
needed when later arguments must compare local cap order with the ambient
convex-boundary order. -/
theorem capByIndex_cgn4g_strictCapBlockData
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) :
    Nonempty (Problem97.CGN.StrictCapBlockData A (S.capByIndex i)) := by
  fin_cases i
  · exact Problem97.CGN.CGN4g_strictCapBlockData_of_supportCap
      (A := A) (C := S.capByIndex 0) (M := S.triangleByIndex 0)
      hconv S.hncol (S.capByIndex_subset 0)
      (S.capByIndex_arc_membership 0)
      (S.triangleByIndex_v2_mem_capByIndex 0)
      (S.triangleByIndex_v3_mem_capByIndex 0)
      (by simpa [triangleByIndex] using S.circPacket)
      (by simpa [triangleByIndex] using S.circPacket.inner_at_v1)
  · exact Problem97.CGN.CGN4g_strictCapBlockData_of_supportCap
      (A := A) (C := S.capByIndex 1) (M := S.triangleByIndex 1)
      hconv S.hncol (S.capByIndex_subset 1)
      (S.capByIndex_arc_membership 1)
      (S.triangleByIndex_v2_mem_capByIndex 1)
      (S.triangleByIndex_v3_mem_capByIndex 1)
      S.circPacket2
      (by simpa [triangleByIndex] using S.circPacket2.inner_at_v1)
  · exact Problem97.CGN.CGN4g_strictCapBlockData_of_supportCap
      (A := A) (C := S.capByIndex 2) (M := S.triangleByIndex 2)
      hconv S.hncol (S.capByIndex_subset 2)
      (S.capByIndex_arc_membership 2)
      (S.triangleByIndex_v2_mem_capByIndex 2)
      (S.triangleByIndex_v3_mem_capByIndex 2)
      S.circPacket3
      (by simpa [triangleByIndex] using S.circPacket3.inner_at_v1)

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

/-- At the first non-surplus cap index, the left outer endpoint is the Moser
apex opposite the surplus cap.  This is the `u` label in the pinned COMP-G
orientation. -/
theorem leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftOuterVertexByIndex S.oppIndex1 =
      S.oppositeVertexByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [leftOuterVertexByIndex, oppositeVertexByIndex, oppIndex1, hi]

/-- At the first non-surplus cap index, the right outer endpoint is the Moser
apex opposite the second non-surplus cap.  This is the `w` label in the pinned
COMP-G orientation. -/
theorem rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightOuterVertexByIndex S.oppIndex1 =
      S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightOuterVertexByIndex, oppositeVertexByIndex, oppIndex1,
      oppIndex2, hi]

/-- At the second non-surplus cap index, the right outer endpoint is the Moser
apex opposite the surplus cap.  This is the `u` label in the mirror pinned
COMP-G orientation. -/
theorem rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightOuterVertexByIndex S.oppIndex2 =
      S.oppositeVertexByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightOuterVertexByIndex, oppositeVertexByIndex, oppIndex2, hi]

/-- At the second non-surplus cap index, the left outer endpoint is the Moser
apex opposite the first non-surplus cap.  This is the `w` label in the mirror
pinned COMP-G orientation. -/
theorem leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftOuterVertexByIndex S.oppIndex2 =
      S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [leftOuterVertexByIndex, oppositeVertexByIndex, oppIndex1,
      oppIndex2, hi]

/-- The first non-surplus index is the left-adjacent index of the surplus cap. -/
theorem oppIndex1_eq_leftAdjacentIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppIndex1 = leftAdjacentIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;> simp [oppIndex1, leftAdjacentIndex, hi]

/-- The second non-surplus index is the right-adjacent index of the surplus
cap. -/
theorem oppIndex2_eq_rightAdjacentIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppIndex2 = rightAdjacentIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;> simp [oppIndex2, rightAdjacentIndex, hi]

/-- The surplus cap index is distinct from the first non-surplus cap index. -/
theorem surplusIdx_ne_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusIdx ≠ S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;> simp [oppIndex1, hi]

/-- The surplus cap index is distinct from the second non-surplus cap index. -/
theorem surplusIdx_ne_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusIdx ≠ S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;> simp [oppIndex2, hi]

/-- The two non-surplus cap indices are distinct. -/
theorem oppIndex1_ne_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppIndex1 ≠ S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;> simp [oppIndex1, oppIndex2, hi]

/-- Every cap index is either the surplus index or one of the two non-surplus
indices. -/
theorem index_eq_surplusIdx_or_oppIndex1_or_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    i = S.surplusIdx ∨ i = S.oppIndex1 ∨ i = S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;> fin_cases i <;>
    simp [oppIndex1, oppIndex2, hi]

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

/-- The opposite Moser endpoint for an indexed cap lies in the closed
left-adjacent cap. -/
theorem oppositeVertexByIndex_mem_leftAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex i ∈ S.leftAdjacentCapByIndex i := by
  fin_cases i
  · exact S.partition.v1_mem_C2
  · exact S.partition.v2_mem_C3
  · exact S.partition.v3_mem_C1

/-- The opposite Moser endpoint for an indexed cap lies in the closed
right-adjacent cap. -/
theorem oppositeVertexByIndex_mem_rightAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex i ∈ S.rightAdjacentCapByIndex i := by
  fin_cases i
  · exact S.partition.v1_mem_C3
  · exact S.partition.v2_mem_C1
  · exact S.partition.v3_mem_C2

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

/-- Distinct cap indices have distinct opposite Moser endpoints. -/
theorem oppositeVertexByIndex_ne_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hij : i ≠ j) :
    S.oppositeVertexByIndex i ≠ S.oppositeVertexByIndex j := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · simpa [oppositeVertexByIndex] using S.triangle.v12_ne
  · simpa [oppositeVertexByIndex] using S.triangle.v13_ne
  · simpa [oppositeVertexByIndex] using S.triangle.v12_ne.symm
  · exact False.elim (hij rfl)
  · simpa [oppositeVertexByIndex] using S.triangle.v23_ne
  · simpa [oppositeVertexByIndex] using S.triangle.v13_ne.symm
  · simpa [oppositeVertexByIndex] using S.triangle.v23_ne.symm
  · exact False.elim (hij rfl)

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

/-- The indexed opposite Moser endpoint is one of the three Moser vertices. -/
theorem oppositeVertexByIndex_mem_triangle_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex i ∈ S.triangle.verts := by
  fin_cases i <;> simp [oppositeVertexByIndex, MoserTriangle.verts]

/-- A Moser vertex is one of the three opposite vertices indexed by the surplus
and non-surplus cap indices. -/
theorem mem_triangle_verts_oppositeVertexByIndex_cases
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.triangle.verts) :
    x = S.oppositeVertexByIndex S.surplusIdx ∨
      x = S.oppositeVertexByIndex S.oppIndex1 ∨
      x = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    rcases mem_triangle_verts_cases hx with rfl | rfl | rfl <;>
      simp [oppositeVertexByIndex, oppIndex1, oppIndex2, hi]

/-- The indexed left outer Moser endpoint is one of the three Moser vertices. -/
theorem leftOuterVertexByIndex_mem_triangle_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftOuterVertexByIndex i ∈ S.triangle.verts := by
  fin_cases i <;> simp [leftOuterVertexByIndex, MoserTriangle.verts]

/-- The indexed right outer Moser endpoint is one of the three Moser
vertices. -/
theorem rightOuterVertexByIndex_mem_triangle_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightOuterVertexByIndex i ∈ S.triangle.verts := by
  fin_cases i <;> simp [rightOuterVertexByIndex, MoserTriangle.verts]

/-- Any two distinct Moser vertices are either the two endpoints of the indexed
cap, or one of them is the Moser vertex opposite that cap. -/
theorem triangle_pair_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {m₁ m₂ : ℝ²}
    (hm₁ : m₁ ∈ S.triangle.verts)
    (hm₂ : m₂ ∈ S.triangle.verts)
    (hne : m₁ ≠ m₂) :
    ((m₁ = S.leftOuterVertexByIndex i ∧
        m₂ = S.rightOuterVertexByIndex i) ∨
      (m₁ = S.rightOuterVertexByIndex i ∧
        m₂ = S.leftOuterVertexByIndex i)) ∨
      (m₁ = S.oppositeVertexByIndex i ∨
        m₂ = S.oppositeVertexByIndex i) := by
  rcases mem_triangle_verts_cases hm₁ with rfl | rfl | rfl <;>
    rcases mem_triangle_verts_cases hm₂ with rfl | rfl | rfl <;>
    fin_cases i <;>
    first
    | exact False.elim (hne rfl)
    | simp only [leftOuterVertexByIndex, rightOuterVertexByIndex,
        oppositeVertexByIndex, true_and, and_true, true_or, or_true]

/-- Every ambient point is either one of the three Moser vertices or belongs
to the strict interior of one indexed cap. -/
theorem mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} (hxA : x ∈ A) :
    x ∈ S.triangle.verts ∨ ∃ i : Fin 3, x ∈ S.capInteriorByIndex i := by
  classical
  by_cases hxMoser : x ∈ S.triangle.verts
  · exact Or.inl hxMoser
  · right
    have hone := S.partition.nonmoser_in_one x hxA hxMoser
    by_cases hxC1 : x ∈ S.partition.C1
    · refine ⟨0, ?_⟩
      exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 0
        (by simpa [capByIndex] using hxC1)
        (by
          intro h
          exact hxMoser
            (by simpa [h] using S.rightOuterVertexByIndex_mem_triangle_verts 0))
        (by
          intro h
          exact hxMoser
            (by simpa [h] using S.leftOuterVertexByIndex_mem_triangle_verts 0))
    · by_cases hxC2 : x ∈ S.partition.C2
      · refine ⟨1, ?_⟩
        exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 1
          (by simpa [capByIndex] using hxC2)
          (by
            intro h
            exact hxMoser
              (by simpa [h] using S.rightOuterVertexByIndex_mem_triangle_verts 1))
          (by
            intro h
            exact hxMoser
              (by simpa [h] using S.leftOuterVertexByIndex_mem_triangle_verts 1))
      · have hxC3 : x ∈ S.partition.C3 := by
          by_cases hxC3 : x ∈ S.partition.C3
          · exact hxC3
          · simp [hxC1, hxC2, hxC3] at hone
        refine ⟨2, ?_⟩
        exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 2
          (by simpa [capByIndex] using hxC3)
          (by
            intro h
            exact hxMoser
              (by simpa [h] using S.rightOuterVertexByIndex_mem_triangle_verts 2))
          (by
            intro h
            exact hxMoser
              (by simpa [h] using S.leftOuterVertexByIndex_mem_triangle_verts 2))

/-- The three Moser vertices lie in the two caps adjacent to any indexed cap. -/
theorem triangle_verts_subset_adjacentCapsByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.triangle.verts ⊆
      S.leftAdjacentCapByIndex i ∪ S.rightAdjacentCapByIndex i := by
  intro x hx
  fin_cases i
  · rcases mem_triangle_verts_cases hx with rfl | rfl | rfl
    · exact Finset.mem_union.mpr (Or.inl S.partition.v1_mem_C2)
    · exact Finset.mem_union.mpr (Or.inr S.partition.v2_mem_C3)
    · exact Finset.mem_union.mpr (Or.inl S.partition.v3_mem_C2)
  · rcases mem_triangle_verts_cases hx with rfl | rfl | rfl
    · exact Finset.mem_union.mpr (Or.inl S.partition.v1_mem_C3)
    · exact Finset.mem_union.mpr (Or.inl S.partition.v2_mem_C3)
    · exact Finset.mem_union.mpr (Or.inr S.partition.v3_mem_C1)
  · rcases mem_triangle_verts_cases hx with rfl | rfl | rfl
    · exact Finset.mem_union.mpr (Or.inr S.partition.v1_mem_C2)
    · exact Finset.mem_union.mpr (Or.inl S.partition.v2_mem_C1)
    · exact Finset.mem_union.mpr (Or.inl S.partition.v3_mem_C1)

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

/-- A strict interior point of an indexed cap is not a Moser vertex. -/
theorem capInteriorByIndex_not_mem_triangle_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ∉ S.triangle.verts := by
  intro hxVerts
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hxI) with
    ⟨_hxCap, hxNotAdj⟩
  exact hxNotAdj (S.triangle_verts_subset_adjacentCapsByIndex i hxVerts)

/-- A strict interior point of any indexed cap is distinct from any indexed
opposite Moser endpoint. -/
theorem capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ≠ S.oppositeVertexByIndex j := by
  intro h
  exact S.capInteriorByIndex_not_mem_triangle_verts hxI
    (by simpa [h] using S.oppositeVertexByIndex_mem_triangle_verts j)

/-- A strict interior point of one indexed cap is not in any other indexed
closed cap. -/
theorem capInteriorByIndex_not_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) (hij : i ≠ j) :
    x ∉ S.capByIndex j := by
  have hprivate := S.capInteriorByIndex_mem_private i hxI
  rcases Finset.mem_sdiff.mp hprivate with ⟨_hxCap, hxNotAdj⟩
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · intro hx
    apply hxNotAdj
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex, capByIndex,
      Finset.mem_union]
    exact Or.inl hx
  · intro hx
    apply hxNotAdj
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex, capByIndex,
      Finset.mem_union]
    exact Or.inr hx
  · intro hx
    apply hxNotAdj
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex, capByIndex,
      Finset.mem_union]
    exact Or.inr hx
  · exact False.elim (hij rfl)
  · intro hx
    apply hxNotAdj
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex, capByIndex,
      Finset.mem_union]
    exact Or.inl hx
  · intro hx
    apply hxNotAdj
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex, capByIndex,
      Finset.mem_union]
    exact Or.inl hx
  · intro hx
    apply hxNotAdj
    simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex, capByIndex,
      Finset.mem_union]
    exact Or.inr hx
  · exact False.elim (hij rfl)

/-- Strict interior points from different indexed caps are distinct. -/
theorem capInteriorByIndex_ne_of_mem_of_mem_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3} {x y : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) (hyI : y ∈ S.capInteriorByIndex j)
    (hij : i ≠ j) :
    x ≠ y := by
  intro hxy
  exact S.capInteriorByIndex_not_mem_capByIndex_of_ne hxI hij
    (S.capInteriorByIndex_subset_capByIndex j (by simpa [← hxy] using hyI))

/-- A strict interior point is distinct from the indexed cap's left outer
Moser endpoint. -/
theorem capInteriorByIndex_ne_leftOuterVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ≠ S.leftOuterVertexByIndex i := by
  intro h
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hxI) with
    ⟨_hxCap, hxNotAdj⟩
  exact hxNotAdj (Finset.mem_union.mpr
    (Or.inl (by
      simpa [h] using S.leftOuterVertexByIndex_mem_leftAdjacentCapByIndex i)))

/-- A strict interior point is distinct from the indexed cap's right outer
Moser endpoint. -/
theorem capInteriorByIndex_ne_rightOuterVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ≠ S.rightOuterVertexByIndex i := by
  intro h
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hxI) with
    ⟨_hxCap, hxNotAdj⟩
  exact hxNotAdj (Finset.mem_union.mpr
    (Or.inr (by
      simpa [h] using S.rightOuterVertexByIndex_mem_rightAdjacentCapByIndex i)))

/-- A strict interior point is distinct from the indexed cap's opposite Moser
endpoint. -/
theorem capInteriorByIndex_ne_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ≠ S.oppositeVertexByIndex i := by
  intro h
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hxI) with
    ⟨_hxCap, hxNotAdj⟩
  exact hxNotAdj (Finset.mem_union.mpr
    (Or.inl (by
      simpa [h] using S.oppositeVertexByIndex_mem_leftAdjacentCapByIndex i)))

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

/-- Two selected strict-interior points of the same indexed cap cannot also be
equidistant from the right outer Moser endpoint. -/
theorem capInterior_pair_dist_ne_rightOuter_of_selectedClass
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius : ℝ} {p₁ p₂ : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex i)
    (hp₂I : p₂ ∈ S.capInteriorByIndex i)
    (hpne : p₁ ≠ p₂)
    (hp₁T : p₁ ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hp₂T : p₂ ∈ SelectedClass A (S.oppositeVertexByIndex i) radius) :
    dist p₁ (S.rightOuterVertexByIndex i) ≠
      dist p₂ (S.rightOuterVertexByIndex i) := by
  intro hdist
  have hp₁A : p₁ ∈ A := (mem_selectedClass.mp hp₁T).1
  have hp₂A : p₂ ∈ A := (mem_selectedClass.mp hp₂T).1
  have hp₁First : dist p₁ (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hp₁T).2
  have hp₂First : dist p₂ (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hp₂T).2
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hp₁I) with
    ⟨_hp₁Cap, hp₁NotAdj⟩
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hp₂I) with
    ⟨_hp₂Cap, hp₂NotAdj⟩
  have hp₁NotRight : p₁ ∉ S.rightAdjacentCapByIndex i := by
    intro hp₁Right
    exact hp₁NotAdj (Finset.mem_union.mpr (Or.inr hp₁Right))
  have hp₂NotRight : p₂ ∉ S.rightAdjacentCapByIndex i := by
    intro hp₂Right
    exact hp₂NotAdj (Finset.mem_union.mpr (Or.inr hp₂Right))
  fin_cases i
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (2 : Fin 3)
      hp₁A hp₂A
      (by simpa [rightAdjacentCapByIndex] using hp₁NotRight)
      (by simpa [rightAdjacentCapByIndex] using hp₂NotRight)
      hpne
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₁First)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₂First)
      (by rfl)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hdist.symm)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (0 : Fin 3)
      hp₁A hp₂A
      (by simpa [rightAdjacentCapByIndex] using hp₁NotRight)
      (by simpa [rightAdjacentCapByIndex] using hp₂NotRight)
      hpne
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₁First)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₂First)
      (by rfl)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hdist.symm)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (1 : Fin 3)
      hp₁A hp₂A
      (by simpa [rightAdjacentCapByIndex] using hp₁NotRight)
      (by simpa [rightAdjacentCapByIndex] using hp₂NotRight)
      hpne
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₁First)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₂First)
      (by rfl)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hdist.symm)

/-- Two selected strict-interior points of the same indexed cap cannot also be
equidistant from the left outer Moser endpoint. -/
theorem capInterior_pair_dist_ne_leftOuter_of_selectedClass
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius : ℝ} {p₁ p₂ : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex i)
    (hp₂I : p₂ ∈ S.capInteriorByIndex i)
    (hpne : p₁ ≠ p₂)
    (hp₁T : p₁ ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hp₂T : p₂ ∈ SelectedClass A (S.oppositeVertexByIndex i) radius) :
    dist p₁ (S.leftOuterVertexByIndex i) ≠
      dist p₂ (S.leftOuterVertexByIndex i) := by
  intro hdist
  have hp₁A : p₁ ∈ A := (mem_selectedClass.mp hp₁T).1
  have hp₂A : p₂ ∈ A := (mem_selectedClass.mp hp₂T).1
  have hp₁First : dist p₁ (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hp₁T).2
  have hp₂First : dist p₂ (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hp₂T).2
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hp₁I) with
    ⟨_hp₁Cap, hp₁NotAdj⟩
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hp₂I) with
    ⟨_hp₂Cap, hp₂NotAdj⟩
  have hp₁NotLeft : p₁ ∉ S.leftAdjacentCapByIndex i := by
    intro hp₁Left
    exact hp₁NotAdj (Finset.mem_union.mpr (Or.inl hp₁Left))
  have hp₂NotLeft : p₂ ∉ S.leftAdjacentCapByIndex i := by
    intro hp₂Left
    exact hp₂NotAdj (Finset.mem_union.mpr (Or.inl hp₂Left))
  fin_cases i
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (1 : Fin 3)
      hp₁A hp₂A
      (by simpa [leftAdjacentCapByIndex] using hp₁NotLeft)
      (by simpa [leftAdjacentCapByIndex] using hp₂NotLeft)
      hpne
      (by rfl)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hdist.symm)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₁First)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₂First)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (2 : Fin 3)
      hp₁A hp₂A
      (by simpa [leftAdjacentCapByIndex] using hp₁NotLeft)
      (by simpa [leftAdjacentCapByIndex] using hp₂NotLeft)
      hpne
      (by rfl)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hdist.symm)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₁First)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₂First)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (0 : Fin 3)
      hp₁A hp₂A
      (by simpa [leftAdjacentCapByIndex] using hp₁NotLeft)
      (by simpa [leftAdjacentCapByIndex] using hp₂NotLeft)
      hpne
      (by rfl)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hdist.symm)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₁First)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hp₂First)

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

/-- In an `(m,4,4)` packet, the strict interior of the surplus cap has at least
three points. -/
theorem IsM44.surplusInterior_card_ge_three
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44) :
    3 ≤ (S.capInteriorByIndex S.surplusIdx).card := by
  have hclosed : 5 ≤ S.surplusCap.card := hM44.surplus_card_ge_five
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx
  · have hcap : 5 ≤ S.partition.C1.card := by
      simpa [surplusCap, hi] using hclosed
    have hv3 : S.triangle.v3 ∈ S.partition.C1.erase S.triangle.v2 := by
      exact Finset.mem_erase.mpr ⟨S.triangle.v23_ne.symm, S.partition.v3_mem_C1⟩
    simp only [capInteriorByIndex]
    rw [Finset.card_erase_of_mem hv3,
      Finset.card_erase_of_mem S.partition.v2_mem_C1]
    omega
  · have hcap : 5 ≤ S.partition.C2.card := by
      simpa [surplusCap, hi] using hclosed
    have hv1 : S.triangle.v1 ∈ S.partition.C2.erase S.triangle.v3 := by
      exact Finset.mem_erase.mpr ⟨S.triangle.v13_ne, S.partition.v1_mem_C2⟩
    simp only [capInteriorByIndex]
    rw [Finset.card_erase_of_mem hv1,
      Finset.card_erase_of_mem S.partition.v3_mem_C2]
    omega
  · have hcap : 5 ≤ S.partition.C3.card := by
      simpa [surplusCap, hi] using hclosed
    have hv2 : S.triangle.v2 ∈ S.partition.C3.erase S.triangle.v1 := by
      exact Finset.mem_erase.mpr ⟨S.triangle.v12_ne.symm, S.partition.v2_mem_C3⟩
    simp only [capInteriorByIndex]
    rw [Finset.card_erase_of_mem hv2,
      Finset.card_erase_of_mem S.partition.v1_mem_C3]
    omega

/-- Any named surplus-interior point in an `(m,4,4)` packet can be embedded in a
three-point surplus-interior subpacket.  This is the finite relabelling step
needed to pass from a general-`m` surplus cap to the `s1,s2,s3` labels used by
the COMP-G fragment bank. -/
theorem IsM44.exists_surplusInterior_triple_preserving
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx) :
    ∃ s1 s2 s3 : ℝ²,
      x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
  classical
  have hpoint :
      ({x} : Finset ℝ²) ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyx : y = x := by simpa using hy
    simpa [hyx] using hx
  have hpoint_card : ({x} : Finset ℝ²).card ≤ 3 := by
    simp
  rcases Finset.exists_subsuperset_card_eq
      (s := ({x} : Finset ℝ²))
      (t := S.capInteriorByIndex S.surplusIdx) (n := 3)
      hpoint hpoint_card hM44.surplusInterior_card_ge_three with
    ⟨T, hpointT, hTsub, hTcard⟩
  rw [Finset.card_eq_three] at hTcard
  rcases hTcard with ⟨s1, s2, s3, hs12, hs13, hs23, hT_eq⟩
  have hxT : x ∈ T := hpointT (by simp)
  exact ⟨s1, s2, s3, by simpa [hT_eq] using hxT,
    hs12, hs13, hs23, by
      rw [← hT_eq]
      exact hTsub⟩

/-- Any at-most-three-point surplus-interior subset in an `(m,4,4)` packet can
be embedded in the three named surplus labels used by the finite bank. -/
theorem IsM44.exists_surplusInterior_triple_preserving_subset
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {T : Finset ℝ²}
    (hTsub : T ⊆ S.capInteriorByIndex S.surplusIdx)
    (hTcard : T.card ≤ 3) :
    ∃ s1 s2 s3 : ℝ²,
      T ⊆ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
  classical
  rcases Finset.exists_subsuperset_card_eq
      (s := T) (t := S.capInteriorByIndex S.surplusIdx) (n := 3)
      hTsub hTcard hM44.surplusInterior_card_ge_three with
    ⟨U, hTU, hUsub, hUcard⟩
  rw [Finset.card_eq_three] at hUcard
  rcases hUcard with ⟨s1, s2, s3, hs12, hs13, hs23, hU_eq⟩
  exact
    ⟨s1, s2, s3, by simpa [hU_eq] using hTU, hs12, hs13, hs23, by
      rw [← hU_eq]
      exact hUsub⟩

/-- The ten concrete labels used by the pinned surplus COMP-G fragment are
geometrically distinct once the two non-surplus private pairs and the
three-point surplus subpacket have been chosen. -/
theorem pinnedSurplusTenLabels_pairwise_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx)
    (hp12 : p₁ ≠ p₂) (hq12 : q₁ ≠ q₂)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3) :
    List.Pairwise (fun x y : ℝ² => x ≠ y)
      [S.oppositeVertexByIndex S.surplusIdx,
        S.oppositeVertexByIndex S.oppIndex1,
        S.oppositeVertexByIndex S.oppIndex2,
        s1, s2, s3, p₁, p₂, q₁, q₂] := by
  have hsu1 : S.surplusIdx ≠ S.oppIndex1 := S.surplusIdx_ne_oppIndex1
  have hsu2 : S.surplusIdx ≠ S.oppIndex2 := S.surplusIdx_ne_oppIndex2
  have h12 : S.oppIndex1 ≠ S.oppIndex2 := S.oppIndex1_ne_oppIndex2
  have hOpp {i j : Fin 3} (hij : i ≠ j) :
      S.oppositeVertexByIndex i ≠ S.oppositeVertexByIndex j :=
    S.oppositeVertexByIndex_ne_of_ne hij
  have hMoser {i j : Fin 3} {y : ℝ²}
      (hy : y ∈ S.capInteriorByIndex i) :
      S.oppositeVertexByIndex j ≠ y :=
    (S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
      (j := j) hy).symm
  have hInterior {i j : Fin 3} {y z : ℝ²}
      (hy : y ∈ S.capInteriorByIndex i)
      (hz : z ∈ S.capInteriorByIndex j) (hij : i ≠ j) :
      y ≠ z :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hy hz hij
  have huv : S.oppositeVertexByIndex S.surplusIdx ≠
      S.oppositeVertexByIndex S.oppIndex1 := hOpp hsu1
  have huw : S.oppositeVertexByIndex S.surplusIdx ≠
      S.oppositeVertexByIndex S.oppIndex2 := hOpp hsu2
  have hvw : S.oppositeVertexByIndex S.oppIndex1 ≠
      S.oppositeVertexByIndex S.oppIndex2 := hOpp h12
  have hus1 : S.oppositeVertexByIndex S.surplusIdx ≠ s1 :=
    hMoser (j := S.surplusIdx) hs1I
  have hus2 : S.oppositeVertexByIndex S.surplusIdx ≠ s2 :=
    hMoser (j := S.surplusIdx) hs2I
  have hus3 : S.oppositeVertexByIndex S.surplusIdx ≠ s3 :=
    hMoser (j := S.surplusIdx) hs3I
  have hup1 : S.oppositeVertexByIndex S.surplusIdx ≠ p₁ :=
    hMoser (j := S.surplusIdx) hp₁I
  have hup2 : S.oppositeVertexByIndex S.surplusIdx ≠ p₂ :=
    hMoser (j := S.surplusIdx) hp₂I
  have huq1 : S.oppositeVertexByIndex S.surplusIdx ≠ q₁ :=
    hMoser (j := S.surplusIdx) hq₁I
  have huq2 : S.oppositeVertexByIndex S.surplusIdx ≠ q₂ :=
    hMoser (j := S.surplusIdx) hq₂I
  have hvs1 : S.oppositeVertexByIndex S.oppIndex1 ≠ s1 :=
    hMoser (j := S.oppIndex1) hs1I
  have hvs2 : S.oppositeVertexByIndex S.oppIndex1 ≠ s2 :=
    hMoser (j := S.oppIndex1) hs2I
  have hvs3 : S.oppositeVertexByIndex S.oppIndex1 ≠ s3 :=
    hMoser (j := S.oppIndex1) hs3I
  have hvp1 : S.oppositeVertexByIndex S.oppIndex1 ≠ p₁ :=
    hMoser (j := S.oppIndex1) hp₁I
  have hvp2 : S.oppositeVertexByIndex S.oppIndex1 ≠ p₂ :=
    hMoser (j := S.oppIndex1) hp₂I
  have hvq1 : S.oppositeVertexByIndex S.oppIndex1 ≠ q₁ :=
    hMoser (j := S.oppIndex1) hq₁I
  have hvq2 : S.oppositeVertexByIndex S.oppIndex1 ≠ q₂ :=
    hMoser (j := S.oppIndex1) hq₂I
  have hws1 : S.oppositeVertexByIndex S.oppIndex2 ≠ s1 :=
    hMoser (j := S.oppIndex2) hs1I
  have hws2 : S.oppositeVertexByIndex S.oppIndex2 ≠ s2 :=
    hMoser (j := S.oppIndex2) hs2I
  have hws3 : S.oppositeVertexByIndex S.oppIndex2 ≠ s3 :=
    hMoser (j := S.oppIndex2) hs3I
  have hwp1 : S.oppositeVertexByIndex S.oppIndex2 ≠ p₁ :=
    hMoser (j := S.oppIndex2) hp₁I
  have hwp2 : S.oppositeVertexByIndex S.oppIndex2 ≠ p₂ :=
    hMoser (j := S.oppIndex2) hp₂I
  have hwq1 : S.oppositeVertexByIndex S.oppIndex2 ≠ q₁ :=
    hMoser (j := S.oppIndex2) hq₁I
  have hwq2 : S.oppositeVertexByIndex S.oppIndex2 ≠ q₂ :=
    hMoser (j := S.oppIndex2) hq₂I
  have hs1p1 : s1 ≠ p₁ := hInterior hs1I hp₁I hsu1
  have hs1p2 : s1 ≠ p₂ := hInterior hs1I hp₂I hsu1
  have hs1q1 : s1 ≠ q₁ := hInterior hs1I hq₁I hsu2
  have hs1q2 : s1 ≠ q₂ := hInterior hs1I hq₂I hsu2
  have hs2p1 : s2 ≠ p₁ := hInterior hs2I hp₁I hsu1
  have hs2p2 : s2 ≠ p₂ := hInterior hs2I hp₂I hsu1
  have hs2q1 : s2 ≠ q₁ := hInterior hs2I hq₁I hsu2
  have hs2q2 : s2 ≠ q₂ := hInterior hs2I hq₂I hsu2
  have hs3p1 : s3 ≠ p₁ := hInterior hs3I hp₁I hsu1
  have hs3p2 : s3 ≠ p₂ := hInterior hs3I hp₂I hsu1
  have hs3q1 : s3 ≠ q₁ := hInterior hs3I hq₁I hsu2
  have hs3q2 : s3 ≠ q₂ := hInterior hs3I hq₂I hsu2
  have hp1q1 : p₁ ≠ q₁ := hInterior hp₁I hq₁I h12
  have hp1q2 : p₁ ≠ q₂ := hInterior hp₁I hq₂I h12
  have hp2q1 : p₂ ≠ q₁ := hInterior hp₂I hq₁I h12
  have hp2q2 : p₂ ≠ q₂ := hInterior hp₂I hq₂I h12
  constructor
  · intro y hy
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
    rcases hy with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
    · exact huv
    · exact huw
    · exact hus1
    · exact hus2
    · exact hus3
    · exact hup1
    · exact hup2
    · exact huq1
    · exact huq2
  · constructor
    · intro y hy
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
      rcases hy with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
      · exact hvw
      · exact hvs1
      · exact hvs2
      · exact hvs3
      · exact hvp1
      · exact hvp2
      · exact hvq1
      · exact hvq2
    · constructor
      · intro y hy
        simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
        rcases hy with rfl | rfl | rfl | rfl | rfl | rfl | rfl
        · exact hws1
        · exact hws2
        · exact hws3
        · exact hwp1
        · exact hwp2
        · exact hwq1
        · exact hwq2
      · constructor
        · intro y hy
          simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
          rcases hy with rfl | rfl | rfl | rfl | rfl | rfl
          · exact hs12
          · exact hs13
          · exact hs1p1
          · exact hs1p2
          · exact hs1q1
          · exact hs1q2
        · constructor
          · intro y hy
            simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
            rcases hy with rfl | rfl | rfl | rfl | rfl
            · exact hs23
            · exact hs2p1
            · exact hs2p2
            · exact hs2q1
            · exact hs2q2
          · constructor
            · intro y hy
              simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
              rcases hy with rfl | rfl | rfl | rfl
              · exact hs3p1
              · exact hs3p2
              · exact hs3q1
              · exact hs3q2
            · constructor
              · intro y hy
                simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
                rcases hy with rfl | rfl | rfl
                · exact hp12
                · exact hp1q1
                · exact hp1q2
              · constructor
                · intro y hy
                  simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
                  rcases hy with rfl | rfl
                  · exact hp2q1
                  · exact hp2q2
                · constructor
                  · intro y hy
                    simp only [List.mem_cons, List.not_mem_nil, or_false] at hy
                    rcases hy with rfl
                    exact hq12
                  · constructor
                    · intro y hy
                      simp only [List.not_mem_nil] at hy
                    · exact List.Pairwise.nil

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

/-- A right-surplus strict escape at the first non-surplus index is a point of
the surplus cap interior. -/
theorem mem_surplusInterior_of_oppIndex1_right_surplus
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1)) :
    x ∈ S.capInteriorByIndex S.surplusIdx := by
  have hxI :=
    S.mem_rightAdjacentInteriorByIndex_of_right_strict_escape S.oppIndex1
      hradius hxT hxSurplus
  simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hxI

/-- A left-surplus strict escape at the second non-surplus index is a point of
the surplus cap interior. -/
theorem mem_surplusInterior_of_oppIndex2_left_surplus
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2)) :
    x ∈ S.capInteriorByIndex S.surplusIdx := by
  have hxI :=
    S.mem_leftAdjacentInteriorByIndex_of_left_strict_escape S.oppIndex2
      hradius hxT hxSurplus
  simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hxI

/-- A right-surplus strict escape at the first non-surplus index can be labelled
inside a three-point surplus-interior subpacket. -/
theorem IsM44.exists_surplusInterior_triple_of_oppIndex1_right_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {radius : ℝ} {x : ℝ²}
    (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1)) :
    ∃ s1 s2 s3 : ℝ²,
      x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
  exact hM44.exists_surplusInterior_triple_preserving
    (S.mem_surplusInterior_of_oppIndex1_right_surplus
      hradius hxT hxSurplus)

/-- A left-surplus strict escape at the second non-surplus index can be labelled
inside a three-point surplus-interior subpacket. -/
theorem IsM44.exists_surplusInterior_triple_of_oppIndex2_left_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {radius : ℝ} {x : ℝ²}
    (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2)) :
    ∃ s1 s2 s3 : ℝ²,
      x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
  exact hM44.exists_surplusInterior_triple_preserving
    (S.mem_surplusInterior_of_oppIndex2_left_surplus
      hradius hxT hxSurplus)

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

/-- Pinned surplus residual payload at the first non-surplus cap index.  This
is the proof-facing local data left after endpoint escape is excluded: the
selected four-class is pinned to the two private points of its own short cap,
the shared endpoint on the other non-surplus side, and the surplus escape point.
The final two fields are the reflection-produced non-equidistance facts for the
two private points against both Moser endpoints of the cap. -/
def PinnedRightSurplusResidualAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (radius : ℝ) (x : ℝ²) :
    Prop :=
  let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius
  ∃ p₁ p₂ : ℝ²,
    p₁ ≠ p₂ ∧
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) ∧
      T.card = 4 ∧
      S.capInteriorByIndex S.oppIndex1 ⊆ T ∧
      S.leftOuterVertexByIndex S.oppIndex1 ∈ T ∧
      x ∈ T ∧
      T ∩ S.leftAdjacentCapByIndex S.oppIndex1 =
        ({S.leftOuterVertexByIndex S.oppIndex1} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.oppIndex1 =
        ({x} : Finset ℝ²) ∧
      dist p₁ (S.rightOuterVertexByIndex S.oppIndex1) ≠
        dist p₂ (S.rightOuterVertexByIndex S.oppIndex1) ∧
      dist p₁ (S.leftOuterVertexByIndex S.oppIndex1) ≠
        dist p₂ (S.leftOuterVertexByIndex S.oppIndex1)

/-- Pinned surplus residual payload at the second non-surplus cap index, with
the mirror orientation: the surplus escape lies on the left-adjacent side and
the shared endpoint on the other non-surplus side is the right outer endpoint. -/
def PinnedLeftSurplusResidualAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (radius : ℝ) (x : ℝ²) :
    Prop :=
  let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius
  ∃ p₁ p₂ : ℝ²,
    p₁ ≠ p₂ ∧
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) ∧
      T.card = 4 ∧
      S.capInteriorByIndex S.oppIndex2 ⊆ T ∧
      S.rightOuterVertexByIndex S.oppIndex2 ∈ T ∧
      x ∈ T ∧
      T ∩ S.leftAdjacentCapByIndex S.oppIndex2 =
        ({x} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.oppIndex2 =
        ({S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²) ∧
      dist p₁ (S.rightOuterVertexByIndex S.oppIndex2) ≠
        dist p₂ (S.rightOuterVertexByIndex S.oppIndex2) ∧
      dist p₁ (S.leftOuterVertexByIndex S.oppIndex2) ≠
        dist p₂ (S.leftOuterVertexByIndex S.oppIndex2)

/-- The right-pinned residual exposes its private two-point cap and the two
non-equidistance facts against the cap endpoints. -/
theorem pinnedRightSurplusResidual_private_pair_nonEquidistant
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x) :
    ∃ p₁ p₂ : ℝ²,
      p₁ ≠ p₂ ∧
        S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) ∧
        dist p₁ (S.rightOuterVertexByIndex S.oppIndex1) ≠
          dist p₂ (S.rightOuterVertexByIndex S.oppIndex1) ∧
        dist p₁ (S.leftOuterVertexByIndex S.oppIndex1) ≠
          dist p₂ (S.leftOuterVertexByIndex S.oppIndex1) := by
  rcases hpinned with
    ⟨p₁, p₂, hpne, hpair, _hcard, _hsub, _hleft, _hx, _hleftEq,
      _hrightEq, hright_ne, hleft_ne⟩
  exact ⟨p₁, p₂, hpne, hpair, hright_ne, hleft_ne⟩

/-- The left-pinned residual exposes its private two-point cap and the two
non-equidistance facts against the cap endpoints. -/
theorem pinnedLeftSurplusResidual_private_pair_nonEquidistant
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x) :
    ∃ p₁ p₂ : ℝ²,
      p₁ ≠ p₂ ∧
        S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) ∧
        dist p₁ (S.rightOuterVertexByIndex S.oppIndex2) ≠
          dist p₂ (S.rightOuterVertexByIndex S.oppIndex2) ∧
        dist p₁ (S.leftOuterVertexByIndex S.oppIndex2) ≠
          dist p₂ (S.leftOuterVertexByIndex S.oppIndex2) := by
  rcases hpinned with
    ⟨p₁, p₂, hpne, hpair, _hcard, _hsub, _hright, _hx, _hleftEq,
      _hrightEq, hright_ne, hleft_ne⟩
  exact ⟨p₁, p₂, hpne, hpair, hright_ne, hleft_ne⟩

/-- The right-pinned residual payload identifies the whole selected class:
there are no points beyond the two private cap-interior points, the other
non-surplus shared endpoint, and the surplus-side escape point. -/
theorem pinnedRightSurplusResidual_selectedClass_eq
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1)) :
    ∃ p₁ p₂ : ℝ²,
      p₁ ≠ p₂ ∧
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius =
        ({p₁, p₂, S.leftOuterVertexByIndex S.oppIndex1, x} :
          Finset ℝ²) := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius
  rcases hpinned with
    ⟨p₁, p₂, hpne, hpair, hTcard, hIsub, hleftT, hxT, _hleftEq,
      _hrightEq, _hright_ne, _hleft_ne⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpair]
    simp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpair]
    simp
  have hp₁T : p₁ ∈ T := hIsub hp₁I
  have hp₂T : p₂ ∈ T := hIsub hp₂I
  have hleftAdj :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
        S.leftAdjacentCapByIndex S.oppIndex1 :=
    S.leftOuterVertexByIndex_mem_leftAdjacentCapByIndex S.oppIndex1
  rcases Finset.mem_sdiff.mp hxSurplus with ⟨hxRight, hxNotOwnOrLeft⟩
  have hxNotLeft : x ∉ S.leftAdjacentCapByIndex S.oppIndex1 := by
    intro hxLeft
    exact hxNotOwnOrLeft (Finset.mem_union.mpr (Or.inr hxLeft))
  rcases Finset.mem_sdiff.mp
      (S.capInteriorByIndex_mem_private S.oppIndex1 hp₁I) with
    ⟨_hp₁Cap, hp₁NotAdj⟩
  rcases Finset.mem_sdiff.mp
      (S.capInteriorByIndex_mem_private S.oppIndex1 hp₂I) with
    ⟨_hp₂Cap, hp₂NotAdj⟩
  have hp₁_ne_left : p₁ ≠ S.leftOuterVertexByIndex S.oppIndex1 := by
    intro h
    exact hp₁NotAdj (Finset.mem_union.mpr
      (Or.inl (by simpa [h] using hleftAdj)))
  have hp₂_ne_left : p₂ ≠ S.leftOuterVertexByIndex S.oppIndex1 := by
    intro h
    exact hp₂NotAdj (Finset.mem_union.mpr
      (Or.inl (by simpa [h] using hleftAdj)))
  have hp₁_ne_x : p₁ ≠ x := by
    intro h
    exact hp₁NotAdj (Finset.mem_union.mpr
      (Or.inr (by simpa [h] using hxRight)))
  have hp₂_ne_x : p₂ ≠ x := by
    intro h
    exact hp₂NotAdj (Finset.mem_union.mpr
      (Or.inr (by simpa [h] using hxRight)))
  have hleft_ne_x : S.leftOuterVertexByIndex S.oppIndex1 ≠ x := by
    intro h
    exact hxNotLeft (by simpa [h] using hleftAdj)
  have hnamed_sub :
      ({p₁, p₂, S.leftOuterVertexByIndex S.oppIndex1, x} :
          Finset ℝ²) ⊆ T := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hp₁T
    · exact hp₂T
    · exact hleftT
    · exact hxT
  have hnamed_card :
      ({p₁, p₂, S.leftOuterVertexByIndex S.oppIndex1, x} :
          Finset ℝ²).card = 4 := by
    simp [hpne, hp₁_ne_left, hp₂_ne_left, hp₁_ne_x, hp₂_ne_x,
      hleft_ne_x]
  have hnamed_eq_T :
      ({p₁, p₂, S.leftOuterVertexByIndex S.oppIndex1, x} :
          Finset ℝ²) = T := by
    exact Finset.eq_of_subset_of_card_le hnamed_sub (by
      rw [hTcard, hnamed_card])
  exact ⟨p₁, p₂, hpne, hpair, by simpa [T] using hnamed_eq_T.symm⟩

/-- The left-pinned residual payload identifies the whole selected class:
there are no points beyond the two private cap-interior points, the surplus-side
escape point, and the other non-surplus shared endpoint. -/
theorem pinnedLeftSurplusResidual_selectedClass_eq
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2)) :
    ∃ p₁ p₂ : ℝ²,
      p₁ ≠ p₂ ∧
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius =
        ({p₁, p₂, x, S.rightOuterVertexByIndex S.oppIndex2} :
          Finset ℝ²) := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius
  rcases hpinned with
    ⟨p₁, p₂, hpne, hpair, hTcard, hIsub, hrightT, hxT, _hleftEq,
      _hrightEq, _hright_ne, _hleft_ne⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpair]
    simp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpair]
    simp
  have hp₁T : p₁ ∈ T := hIsub hp₁I
  have hp₂T : p₂ ∈ T := hIsub hp₂I
  have hrightAdj :
      S.rightOuterVertexByIndex S.oppIndex2 ∈
        S.rightAdjacentCapByIndex S.oppIndex2 :=
    S.rightOuterVertexByIndex_mem_rightAdjacentCapByIndex S.oppIndex2
  rcases Finset.mem_sdiff.mp hxSurplus with ⟨hxLeft, hxNotOwnOrRight⟩
  have hxNotRight : x ∉ S.rightAdjacentCapByIndex S.oppIndex2 := by
    intro hxRight
    exact hxNotOwnOrRight (Finset.mem_union.mpr (Or.inr hxRight))
  rcases Finset.mem_sdiff.mp
      (S.capInteriorByIndex_mem_private S.oppIndex2 hp₁I) with
    ⟨_hp₁Cap, hp₁NotAdj⟩
  rcases Finset.mem_sdiff.mp
      (S.capInteriorByIndex_mem_private S.oppIndex2 hp₂I) with
    ⟨_hp₂Cap, hp₂NotAdj⟩
  have hp₁_ne_right : p₁ ≠ S.rightOuterVertexByIndex S.oppIndex2 := by
    intro h
    exact hp₁NotAdj (Finset.mem_union.mpr
      (Or.inr (by simpa [h] using hrightAdj)))
  have hp₂_ne_right : p₂ ≠ S.rightOuterVertexByIndex S.oppIndex2 := by
    intro h
    exact hp₂NotAdj (Finset.mem_union.mpr
      (Or.inr (by simpa [h] using hrightAdj)))
  have hp₁_ne_x : p₁ ≠ x := by
    intro h
    exact hp₁NotAdj (Finset.mem_union.mpr
      (Or.inl (by simpa [h] using hxLeft)))
  have hp₂_ne_x : p₂ ≠ x := by
    intro h
    exact hp₂NotAdj (Finset.mem_union.mpr
      (Or.inl (by simpa [h] using hxLeft)))
  have hx_ne_right : x ≠ S.rightOuterVertexByIndex S.oppIndex2 := by
    intro h
    exact hxNotRight (by simpa [← h] using hrightAdj)
  have hnamed_sub :
      ({p₁, p₂, x, S.rightOuterVertexByIndex S.oppIndex2} :
          Finset ℝ²) ⊆ T := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hp₁T
    · exact hp₂T
    · exact hxT
    · exact hrightT
  have hnamed_card :
      ({p₁, p₂, x, S.rightOuterVertexByIndex S.oppIndex2} :
          Finset ℝ²).card = 4 := by
    simp [hpne, hp₁_ne_right, hp₂_ne_right, hp₁_ne_x, hp₂_ne_x,
      hx_ne_right]
  have hnamed_eq_T :
      ({p₁, p₂, x, S.rightOuterVertexByIndex S.oppIndex2} :
          Finset ℝ²) = T := by
    exact Finset.eq_of_subset_of_card_le hnamed_sub (by
      rw [hTcard, hnamed_card])
  exact ⟨p₁, p₂, hpne, hpair, by simpa [T] using hnamed_eq_T.symm⟩

/-- Right-pinned residual exactness rewritten with the surplus Moser apex as
the named endpoint.  This is the geometric shape corresponding to the bank
mask `{u, s*, Pw, Pu}` for the selected `.v` center. -/
theorem pinnedRightSurplusResidual_selectedClass_eq_surplusApex
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1)) :
    ∃ p₁ p₂ : ℝ²,
      p₁ ≠ p₂ ∧
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius =
        ({p₁, p₂, S.oppositeVertexByIndex S.surplusIdx, x} :
          Finset ℝ²) := by
  rcases S.pinnedRightSurplusResidual_selectedClass_eq hpinned hxSurplus with
    ⟨p₁, p₂, hpne, hpair, hT⟩
  exact ⟨p₁, p₂, hpne, hpair, by
    simpa [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx]
      using hT⟩

/-- Left-pinned residual exactness rewritten with the surplus Moser apex as
the named endpoint.  This is the mirror geometric shape corresponding to the
bank mask `{u, s*, Pw, Pu}` for the selected `.v` center. -/
theorem pinnedLeftSurplusResidual_selectedClass_eq_surplusApex
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2)) :
    ∃ p₁ p₂ : ℝ²,
      p₁ ≠ p₂ ∧
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius =
        ({p₁, p₂, x, S.oppositeVertexByIndex S.surplusIdx} :
          Finset ℝ²) := by
  rcases S.pinnedLeftSurplusResidual_selectedClass_eq hpinned hxSurplus with
    ⟨p₁, p₂, hpne, hpair, hT⟩
  exact ⟨p₁, p₂, hpne, hpair, by
    simpa [S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
      using hT⟩

/-- A surplus-side residual at the first non-surplus index pins the selected
four-class: the other adjacent singleton is the shared endpoint, and the surplus
side singleton is the residual point. -/
theorem IsM44.oppIndex1_pin_of_right_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card)
    (hend : ∀ {rho : ℝ} {y : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho y → False)
    {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪
        S.leftAdjacentCapByIndex S.oppIndex1)) :
    let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius
    T.card = 4 ∧
      S.capInteriorByIndex S.oppIndex1 ⊆ T ∧
      S.leftOuterVertexByIndex S.oppIndex1 ∈ T ∧
      x ∈ T ∧
      T ∩ S.leftAdjacentCapByIndex S.oppIndex1 =
        ({S.leftOuterVertexByIndex S.oppIndex1} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.oppIndex1 = ({x} : Finset ℝ²) := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius
  rcases S.moserSelectorShapeAt_of_convexIndep hconv S.oppIndex1
      hradius hM44.oppIndex1_cap_card_eq_four hcard with
    ⟨hTcard, hIsub, p, q, hpLeft, _hqRight, hleftEq, hrightEq⟩
  have hpInter : p ∈ T ∩ S.leftAdjacentCapByIndex S.oppIndex1 := by
    have hp : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hleftEq] at hp
    simpa [T] using hp
  have hpT : p ∈ T := (Finset.mem_inter.mp hpInter).1
  have hpEq : p = S.leftOuterVertexByIndex S.oppIndex1 := by
    by_contra hpne
    have hpInterior :
        p ∈ S.leftAdjacentInteriorByIndex S.oppIndex1 :=
      S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
        S.oppIndex1 hradius (by simpa [T] using hpT) hpLeft hpne
    have hpStrict :
        p ∈ S.leftAdjacentCapByIndex S.oppIndex1 \
          (S.capByIndex S.oppIndex1 ∪
            S.rightAdjacentCapByIndex S.oppIndex1) :=
      S.leftAdjacentInteriorByIndex_mem_strict S.oppIndex1 hpInterior
    exact hM44.leftStrictEscape_oppIndex1_endpointData_elim hK4 hconv
      hradius hcard (by simpa [T] using hpT) hpStrict
      (fun {rho} hres => hend (rho := rho) (y := p) hres)
  have hxRightInter :
      x ∈ T ∩ S.rightAdjacentCapByIndex S.oppIndex1 := by
    exact Finset.mem_inter.mpr
      ⟨by simpa [T] using hxT, (Finset.mem_sdiff.mp hxSurplus).1⟩
  have hxEqQ : x = q := by
    have hx : x ∈ ({q} : Finset ℝ²) := by
      rw [← hrightEq]
      simpa [T] using hxRightInter
    simpa using hx
  exact ⟨by simpa [T] using hTcard,
    by simpa [T] using hIsub,
    by
      have hp : p ∈ ({p} : Finset ℝ²) := by simp
      rw [← hleftEq] at hp
      exact by simpa [T, hpEq] using (Finset.mem_inter.mp hp).1,
    by simpa [T] using hxT,
    by simpa [T, hpEq] using hleftEq,
    by simpa [T, hxEqQ] using hrightEq⟩

/-- A surplus-side residual at the second non-surplus index pins the selected
four-class: the surplus-side singleton is the residual point, and the other
adjacent singleton is the shared endpoint. -/
theorem IsM44.oppIndex2_pin_of_left_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card)
    (hend : ∀ {rho : ℝ} {y : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho y → False)
    {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪
        S.rightAdjacentCapByIndex S.oppIndex2)) :
    let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius
    T.card = 4 ∧
      S.capInteriorByIndex S.oppIndex2 ⊆ T ∧
      S.rightOuterVertexByIndex S.oppIndex2 ∈ T ∧
      x ∈ T ∧
      T ∩ S.leftAdjacentCapByIndex S.oppIndex2 = ({x} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.oppIndex2 =
        ({S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²) := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius
  rcases S.moserSelectorShapeAt_of_convexIndep hconv S.oppIndex2
      hradius hM44.oppIndex2_cap_card_eq_four hcard with
    ⟨hTcard, hIsub, p, q, _hpLeft, hqRight, hleftEq, hrightEq⟩
  have hqInter : q ∈ T ∩ S.rightAdjacentCapByIndex S.oppIndex2 := by
    have hq : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hrightEq] at hq
    simpa [T] using hq
  have hqT : q ∈ T := (Finset.mem_inter.mp hqInter).1
  have hqEq : q = S.rightOuterVertexByIndex S.oppIndex2 := by
    by_contra hqne
    have hqInterior :
        q ∈ S.rightAdjacentInteriorByIndex S.oppIndex2 :=
      S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
        S.oppIndex2 hradius (by simpa [T] using hqT) hqRight hqne
    have hqStrict :
        q ∈ S.rightAdjacentCapByIndex S.oppIndex2 \
          (S.capByIndex S.oppIndex2 ∪
            S.leftAdjacentCapByIndex S.oppIndex2) :=
      S.rightAdjacentInteriorByIndex_mem_strict S.oppIndex2 hqInterior
    exact hM44.rightStrictEscape_oppIndex2_endpointData_elim hK4 hconv
      hradius hcard (by simpa [T] using hqT) hqStrict
      (fun {rho} hres => hend (rho := rho) (y := q) hres)
  have hxLeftInter :
      x ∈ T ∩ S.leftAdjacentCapByIndex S.oppIndex2 := by
    exact Finset.mem_inter.mpr
      ⟨by simpa [T] using hxT, (Finset.mem_sdiff.mp hxSurplus).1⟩
  have hxEqP : x = p := by
    have hx : x ∈ ({p} : Finset ℝ²) := by
      rw [← hleftEq]
      simpa [T] using hxLeftInter
    simpa using hx
  exact ⟨by simpa [T] using hTcard,
    by simpa [T] using hIsub,
    by
      have hq : q ∈ ({q} : Finset ℝ²) := by simp
      rw [← hrightEq] at hq
      exact by simpa [T, hqEq] using (Finset.mem_inter.mp hq).1,
    by simpa [T] using hxT,
    by simpa [T, hxEqP] using hleftEq,
    by simpa [T, hqEq] using hrightEq⟩

/-- A right-surplus escape at the first non-surplus index produces the pinned
residual payload consumed by the COMP-G surplus branch. -/
theorem IsM44.oppIndex1_pinnedRightSurplusResidual_of_right_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card)
    (hend : ∀ {rho : ℝ} {y : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho y → False)
    {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪
        S.leftAdjacentCapByIndex S.oppIndex1)) :
    S.PinnedRightSurplusResidualAt radius x := by
  classical
  rcases hM44.exists_oppInterior_pairs with
    ⟨p₁, p₂, _q₁, _q₂, hpne, hpair, _hqne, _hpair2⟩
  have hpairCap :
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [oppInterior1] using hpair
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpairCap]
    simp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpairCap]
    simp
  rcases hM44.oppIndex1_pin_of_right_surplus hK4 hconv hradius hcard
      hend hxT hxSurplus with
    ⟨hTcard, hIsub, hleftOuterT, hxT', hleftEq, hrightEq⟩
  have hp₁T : p₁ ∈
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius :=
    hIsub hp₁I
  have hp₂T : p₂ ∈
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius :=
    hIsub hp₂I
  have hright_ne :
      dist p₁ (S.rightOuterVertexByIndex S.oppIndex1) ≠
        dist p₂ (S.rightOuterVertexByIndex S.oppIndex1) :=
    S.capInterior_pair_dist_ne_rightOuter_of_selectedClass S.oppIndex1
      hp₁I hp₂I hpne hp₁T hp₂T
  have hleft_ne :
      dist p₁ (S.leftOuterVertexByIndex S.oppIndex1) ≠
        dist p₂ (S.leftOuterVertexByIndex S.oppIndex1) :=
    S.capInterior_pair_dist_ne_leftOuter_of_selectedClass S.oppIndex1
      hp₁I hp₂I hpne hp₁T hp₂T
  exact ⟨p₁, p₂, hpne, hpairCap, hTcard, hIsub,
    hleftOuterT, hxT', hleftEq, hrightEq, hright_ne, hleft_ne⟩

/-- A left-surplus escape at the second non-surplus index produces the mirror
pinned residual payload consumed by the COMP-G surplus branch. -/
theorem IsM44.oppIndex2_pinnedLeftSurplusResidual_of_left_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card)
    (hend : ∀ {rho : ℝ} {y : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho y → False)
    {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪
        S.rightAdjacentCapByIndex S.oppIndex2)) :
    S.PinnedLeftSurplusResidualAt radius x := by
  classical
  rcases hM44.exists_oppInterior_pairs with
    ⟨_q₁, _q₂, p₁, p₂, _hqne, _hpair1, hpne, hpair⟩
  have hpairCap :
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [oppInterior2] using hpair
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpairCap]
    simp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpairCap]
    simp
  rcases hM44.oppIndex2_pin_of_left_surplus hK4 hconv hradius hcard
      hend hxT hxSurplus with
    ⟨hTcard, hIsub, hrightOuterT, hxT', hleftEq, hrightEq⟩
  have hp₁T : p₁ ∈
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius :=
    hIsub hp₁I
  have hp₂T : p₂ ∈
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius :=
    hIsub hp₂I
  have hright_ne :
      dist p₁ (S.rightOuterVertexByIndex S.oppIndex2) ≠
        dist p₂ (S.rightOuterVertexByIndex S.oppIndex2) :=
    S.capInterior_pair_dist_ne_rightOuter_of_selectedClass S.oppIndex2
      hp₁I hp₂I hpne hp₁T hp₂T
  have hleft_ne :
      dist p₁ (S.leftOuterVertexByIndex S.oppIndex2) ≠
        dist p₂ (S.leftOuterVertexByIndex S.oppIndex2) :=
    S.capInterior_pair_dist_ne_leftOuter_of_selectedClass S.oppIndex2
      hp₁I hp₂I hpne hp₁T hp₂T
  exact ⟨p₁, p₂, hpne, hpairCap, hTcard, hIsub,
    hrightOuterT, hxT', hleftEq, hrightEq, hright_ne, hleft_ne⟩

/-- A right-surplus escape at the first non-surplus index produces both the
pinned residual payload and a three-point surplus-interior subpacket containing
the escape. -/
theorem IsM44.oppIndex1_pinnedRightResidual_and_surplusTriple_of_right_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card)
    (hend : ∀ {rho : ℝ} {y : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho y → False)
    {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1)) :
    S.PinnedRightSurplusResidualAt radius x ∧
      ∃ s1 s2 s3 : ℝ²,
        x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
        s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
        ({s1, s2, s3} : Finset ℝ²) ⊆
          S.capInteriorByIndex S.surplusIdx := by
  exact ⟨hM44.oppIndex1_pinnedRightSurplusResidual_of_right_surplus
      hK4 hconv hradius hcard hend hxT hxSurplus,
    hM44.exists_surplusInterior_triple_of_oppIndex1_right_surplus
      hradius hxT hxSurplus⟩

/-- A left-surplus escape at the second non-surplus index produces both the
mirror pinned residual payload and a three-point surplus-interior subpacket
containing the escape. -/
theorem IsM44.oppIndex2_pinnedLeftResidual_and_surplusTriple_of_left_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card)
    (hend : ∀ {rho : ℝ} {y : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho y → False)
    {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2)) :
    S.PinnedLeftSurplusResidualAt radius x ∧
      ∃ s1 s2 s3 : ℝ²,
        x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
        s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
        ({s1, s2, s3} : Finset ℝ²) ⊆
          S.capInteriorByIndex S.surplusIdx := by
  exact ⟨hM44.oppIndex2_pinnedLeftSurplusResidual_of_left_surplus
      hK4 hconv hradius hcard hend hxT hxSurplus,
    hM44.exists_surplusInterior_triple_of_oppIndex2_left_surplus
      hradius hxT hxSurplus⟩

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

/-- Endpoint residuals plus the pinned surplus residual payload exclusions
exclude strict adjacent escape at both non-surplus cap indices.  Compared with
`IsM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_surplus_residuals`, the two
surplus assumptions now receive the pinned class and the reflection
non-equidistance facts rather than the raw escape witness alone. -/
theorem IsM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_pinnedSurplusResiduals
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hsurplus1 :
      ∀ {radius : ℝ} {x : ℝ²},
        S.PinnedRightSurplusResidualAt radius x → False)
    (hsurplus2 :
      ∀ {radius : ℝ} {x : ℝ²},
        S.PinnedLeftSurplusResidualAt radius x → False) :
    S.NonSurplusNoStrictAdjacentEscape := by
  constructor
  · intro radius hradius hcard hstrict
    rcases hM44.strictAdjacentEscapeAt_oppIndex1_reduces_to_right_surplus
        hK4 hconv hradius hcard
        (fun {rho} {x} hres =>
          hend1 (radius := radius) (rho := rho) (x := x) hres)
        hstrict with
      ⟨x, hxT, hxSurplus⟩
    exact hsurplus1
      (hM44.oppIndex1_pinnedRightSurplusResidual_of_right_surplus
        hK4 hconv hradius hcard
        (fun {rho} {y} hres =>
          hend1 (radius := radius) (rho := rho) (x := y) hres)
        hxT hxSurplus)
  · intro radius hradius hcard hstrict
    rcases hM44.strictAdjacentEscapeAt_oppIndex2_reduces_to_left_surplus
        hK4 hconv hradius hcard
        (fun {rho} {x} hres =>
          hend2 (radius := radius) (rho := rho) (x := x) hres)
        hstrict with
      ⟨x, hxT, hxSurplus⟩
    exact hsurplus2
      (hM44.oppIndex2_pinnedLeftSurplusResidual_of_left_surplus
        hK4 hconv hradius hcard
        (fun {rho} {y} hres =>
          hend2 (radius := radius) (rho := rho) (x := y) hres)
        hxT hxSurplus)

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

/-- Pinned-residual version of
`IsM44.nonSurplusMoserCapContainment_of_endpoint_surplus_residuals`. -/
theorem IsM44.nonSurplusMoserCapContainment_of_endpoint_pinnedSurplusResiduals
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hsurplus1 :
      ∀ {radius : ℝ} {x : ℝ²},
        S.PinnedRightSurplusResidualAt radius x → False)
    (hsurplus2 :
      ∀ {radius : ℝ} {x : ℝ²},
        S.PinnedLeftSurplusResidualAt radius x → False) :
    S.NonSurplusMoserCapContainment :=
  hM44.nonSurplusMoserCapContainment_of_convexIndep_noStrictAdjacentEscape hconv
    (hM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_pinnedSurplusResiduals
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

/-- An exact cap class survives erasing a strict interior point from a different
indexed cap. -/
theorem selectedClass_erase_card_eq_of_exact_cap_of_capInterior_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3} {x : ℝ²}
    {radius : ℝ}
    (hxI : x ∈ S.capInteriorByIndex j) (hji : j ≠ i)
    (hexact : SelectedClass A (S.oppositeVertexByIndex i) radius =
      S.capByIndex i) :
    (SelectedClass (A.erase x) (S.oppositeVertexByIndex i) radius).card =
      (S.capByIndex i).card := by
  have hxnot : x ∉ SelectedClass A (S.oppositeVertexByIndex i) radius := by
    intro hxsel
    have hxcap : x ∈ S.capByIndex i := by
      simpa [hexact] using hxsel
    exact S.capInteriorByIndex_not_mem_capByIndex_of_ne hxI hji hxcap
  rw [selectedClass_erase_card_eq_of_not_mem hxnot, hexact]

/-- A four-point exact cap class remains a four-point selected class after
erasing a strict interior point from another indexed cap. -/
theorem four_le_selectedClass_erase_of_exact_cap_of_capInterior_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3} {x : ℝ²}
    {radius : ℝ}
    (hxI : x ∈ S.capInteriorByIndex j) (hji : j ≠ i)
    (hcap : (S.capByIndex i).card = 4)
    (hexact : SelectedClass A (S.oppositeVertexByIndex i) radius =
      S.capByIndex i) :
    4 ≤ (SelectedClass (A.erase x) (S.oppositeVertexByIndex i) radius).card := by
  rw [S.selectedClass_erase_card_eq_of_exact_cap_of_capInterior_ne hxI hji hexact,
    hcap]

/-- Erasing a surplus-interior point preserves the exact short-cap witness at
the first non-surplus opposite Moser vertex. -/
theorem IsM44.exists_oppIndex1_erase_witness_of_surplusInterior
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment) {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex S.surplusIdx) :
    ∃ radius : ℝ, 0 < radius ∧
      4 ≤ (SelectedClass (A.erase x)
        (S.oppositeVertexByIndex S.oppIndex1) radius).card := by
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1 hK4
      hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨radius, hradius, hexact⟩
  exact ⟨radius, hradius,
    S.four_le_selectedClass_erase_of_exact_cap_of_capInterior_ne hxI
      S.surplusIdx_ne_oppIndex1 hM44.oppIndex1_cap_card_eq_four hexact⟩

/-- Erasing a surplus-interior point preserves the exact short-cap witness at
the second non-surplus opposite Moser vertex. -/
theorem IsM44.exists_oppIndex2_erase_witness_of_surplusInterior
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment) {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex S.surplusIdx) :
    ∃ radius : ℝ, 0 < radius ∧
      4 ≤ (SelectedClass (A.erase x)
        (S.oppositeVertexByIndex S.oppIndex2) radius).card := by
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2 hK4
      hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨radius, hradius, hexact⟩
  exact ⟨radius, hradius,
    S.four_le_selectedClass_erase_of_exact_cap_of_capInterior_ne hxI
      S.surplusIdx_ne_oppIndex2 hM44.oppIndex2_cap_card_eq_four hexact⟩

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

/- ## Packet-local incidence counts -/

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

/-- The selected class attached to an `M44SelectedApex` contains a four-point
subpacket. -/
theorem M44SelectedApex.exists_fourSubpacket
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x : ℝ²}
    (hx : M44SelectedApex S i x) :
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

/-- The selected class attached to an `M44SelectedApex` contains a four-point
subpacket preserving any chosen selected point. -/
theorem M44SelectedApex.exists_fourSubpacket_preserving_point
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x p : ℝ²}
    (hx : M44SelectedApex S i x)
    (hp : p ∈ SelectedClass A x hx.radius) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 :=
  exists_fourSubpacket_preserving_point_of_selected_card_ge_four
    hp hx.selected_card

/-- Count Moser vertices inside an arbitrary packet. -/
noncomputable def packetMoserCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (T : Finset ℝ²) : ℕ :=
  (T ∩ S.triangle.verts).card

/-- Count own-cap interior points, excluding the apex, inside an arbitrary
packet. -/
noncomputable def packetSameCapCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (x : ℝ²)
    (T : Finset ℝ²) : ℕ :=
  (T ∩ (S.capInteriorByIndex i).erase x).card

/-- Count left-adjacent-cap interior points inside an arbitrary packet. -/
noncomputable def packetLeftAdjCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (T : Finset ℝ²) :
    ℕ :=
  (T ∩ S.leftAdjacentInteriorByIndex i).card

/-- Count right-adjacent-cap interior points inside an arbitrary packet. -/
noncomputable def packetRightAdjCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (T : Finset ℝ²) :
    ℕ :=
  (T ∩ S.rightAdjacentInteriorByIndex i).card

private theorem packet_inter_card_le_selected_inter_card
    {T U C : Finset ℝ²} (hTsub : T ⊆ U) :
    (T ∩ C).card ≤ (U ∩ C).card := by
  exact Finset.card_le_card (by
    intro q hq
    exact Finset.mem_inter.mpr
      ⟨hTsub (Finset.mem_of_mem_inter_left hq),
        Finset.mem_of_mem_inter_right hq⟩)

private theorem inter_card_eq_sum_indicator (T C : Finset ℝ²) :
    (T ∩ C).card = ∑ q ∈ T, (if q ∈ C then 1 else 0) := by
  rw [← Finset.card_filter (fun q => q ∈ C) T]
  rfl

private theorem indicator_le_indicator_of_imp
    {p q : Prop} [Decidable p] [Decidable q] (h : p → q) :
    (if p then 1 else 0 : ℕ) ≤ if q then 1 else 0 := by
  by_cases hp : p <;> simp [hp, h]

/-- Packet-local Moser count is bounded by the corresponding full
selected-class count. -/
theorem packetMoserCount_le_selected
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetMoserCount T ≤ (SelectedClass A x radius ∩ S.triangle.verts).card :=
  packet_inter_card_le_selected_inter_card hTsub

/-- Packet-local same-cap count is bounded by the corresponding full
selected-class count. -/
theorem packetSameCapCount_le_selected
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetSameCapCount i x T ≤
      (SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x).card :=
  packet_inter_card_le_selected_inter_card hTsub

/-- Packet-local left-adjacent count is bounded by the corresponding full
selected-class count. -/
theorem packetLeftAdjCount_le_selected
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetLeftAdjCount i T ≤
      (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i).card :=
  packet_inter_card_le_selected_inter_card hTsub

/-- Packet-local right-adjacent count is bounded by the corresponding full
selected-class count. -/
theorem packetRightAdjCount_le_selected
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetRightAdjCount i T ≤
      (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i).card :=
  packet_inter_card_le_selected_inter_card hTsub

/-- Packet-local Moser count is bounded by the corresponding full selected
class count. -/
theorem packetMoserCount_le_moserCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetMoserCount T ≤ S.moserCount x radius := by
  simpa [moserCount] using S.packetMoserCount_le_selected hTsub

/-- Packet-local same-cap count is bounded by the corresponding full selected
class count. -/
theorem packetSameCapCount_le_sameCapCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetSameCapCount i x T ≤ S.sameCapCount i x radius := by
  simpa [sameCapCount] using S.packetSameCapCount_le_selected i hTsub

/-- Packet-local left-adjacent count is bounded by the corresponding full
selected class count. -/
theorem packetLeftAdjCount_le_leftAdjCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetLeftAdjCount i T ≤ S.leftAdjCount i x radius := by
  simpa [leftAdjCount] using S.packetLeftAdjCount_le_selected i hTsub

/-- Packet-local right-adjacent count is bounded by the corresponding full
selected class count. -/
theorem packetRightAdjCount_le_rightAdjCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetRightAdjCount i T ≤ S.rightAdjCount i x radius := by
  simpa [rightAdjCount] using S.packetRightAdjCount_le_selected i hTsub

/-- A packet same-cap hit is exactly one whenever the full selected class has
the same-cap one-hit bound. -/
theorem packetSameCapCount_eq_one_of_le_one
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius)
    (hpacket : 1 ≤ S.packetSameCapCount i x T)
    (hfull : S.sameCapCount i x radius ≤ 1) :
    S.packetSameCapCount i x T = 1 := by
  have hle : S.packetSameCapCount i x T ≤ 1 :=
    le_trans
      (S.packetSameCapCount_le_sameCapCount
        (x := x) (radius := radius) i hTsub)
      hfull
  omega

/-- A packet left-adjacent hit is exactly one whenever the full selected class
has the left-adjacent one-hit bound. -/
theorem packetLeftAdjCount_eq_one_of_le_one
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius)
    (hpacket : 1 ≤ S.packetLeftAdjCount i T)
    (hfull : S.leftAdjCount i x radius ≤ 1) :
    S.packetLeftAdjCount i T = 1 := by
  have hle : S.packetLeftAdjCount i T ≤ 1 :=
    le_trans
      (S.packetLeftAdjCount_le_leftAdjCount
        (x := x) (radius := radius) i hTsub)
      hfull
  omega

/-- A packet right-adjacent hit is exactly one whenever the full selected class
has the right-adjacent one-hit bound. -/
theorem packetRightAdjCount_eq_one_of_le_one
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius)
    (hpacket : 1 ≤ S.packetRightAdjCount i T)
    (hfull : S.rightAdjCount i x radius ≤ 1) :
    S.packetRightAdjCount i T = 1 := by
  have hle : S.packetRightAdjCount i T ≤ 1 :=
    le_trans
      (S.packetRightAdjCount_le_rightAdjCount
        (x := x) (radius := radius) i hTsub)
      hfull
  omega

/-- A packet member that is a Moser vertex contributes one to the packet Moser
count. -/
theorem one_le_packetMoserCount_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {T : Finset ℝ²} {p : ℝ²}
    (hpT : p ∈ T) (hpM : p ∈ S.triangle.verts) :
    1 ≤ S.packetMoserCount T := by
  unfold packetMoserCount
  exact Finset.card_pos.mpr ⟨p, Finset.mem_inter.mpr ⟨hpT, hpM⟩⟩

/-- A packet member in the same-cap erasure contributes one to the packet
same-cap count. -/
theorem one_le_packetSameCapCount_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x p : ℝ²}
    {T : Finset ℝ²} (hpT : p ∈ T) (hpI : p ∈ (S.capInteriorByIndex i).erase x) :
    1 ≤ S.packetSameCapCount i x T := by
  unfold packetSameCapCount
  exact Finset.card_pos.mpr ⟨p, Finset.mem_inter.mpr ⟨hpT, hpI⟩⟩

/-- A packet member in the left-adjacent cap interior contributes one to the
packet left-adjacent count. -/
theorem one_le_packetLeftAdjCount_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {T : Finset ℝ²}
    {p : ℝ²} (hpT : p ∈ T) (hpI : p ∈ S.leftAdjacentInteriorByIndex i) :
    1 ≤ S.packetLeftAdjCount i T := by
  unfold packetLeftAdjCount
  exact Finset.card_pos.mpr ⟨p, Finset.mem_inter.mpr ⟨hpT, hpI⟩⟩

/-- A packet member in the right-adjacent cap interior contributes one to the
packet right-adjacent count. -/
theorem one_le_packetRightAdjCount_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {T : Finset ℝ²}
    {p : ℝ²} (hpT : p ∈ T) (hpI : p ∈ S.rightAdjacentInteriorByIndex i) :
    1 ≤ S.packetRightAdjCount i T := by
  unfold packetRightAdjCount
  exact Finset.card_pos.mpr ⟨p, Finset.mem_inter.mpr ⟨hpT, hpI⟩⟩

/-- A positive-radius selected class is covered by the Moser triangle, the
same cap with the selected apex erased, and the two adjacent-cap interiors. -/
theorem selectedClass_subset_groupUnion
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hradius_pos : 0 < radius) :
    SelectedClass A x radius ⊆
      S.triangle.verts ∪ (S.capInteriorByIndex i).erase x ∪
        S.leftAdjacentInteriorByIndex i ∪ S.rightAdjacentInteriorByIndex i := by
  classical
  have hx_notin_selected : x ∉ SelectedClass A x radius := by
    intro hh
    have hdist : dist x x = radius := (mem_selectedClass.mp hh).2
    rw [dist_self] at hdist
    linarith
  fin_cases i <;>
  · intro q hqsel
    have hqx : q ≠ x := fun h => hx_notin_selected (h ▸ hqsel)
    have hqA : q ∈ A := (mem_selectedClass.mp hqsel).1
    rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hqA with
      hqv | ⟨j, hj⟩
    · exact Finset.mem_union_left _ (Finset.mem_union_left _
        (Finset.mem_union_left _ hqv))
    · fin_cases j <;>
      simp only [capInteriorByIndex, leftAdjacentInteriorByIndex,
        rightAdjacentInteriorByIndex] at hj ⊢ <;>
      first
      | (refine Finset.mem_union_left _ (Finset.mem_union_left _
            (Finset.mem_union_right _ ?_))
         exact Finset.mem_erase.mpr ⟨hqx, hj⟩)
      | (refine Finset.mem_union_left _ (Finset.mem_union_right _ ?_)
         exact hj)
      | (refine Finset.mem_union_right _ ?_
         exact hj)

/-- Packet-local disjoint-cover budget.  Any packet contained in a
positive-radius selected class is covered by its Moser, same-cap,
left-adjacent, and right-adjacent subfamilies. -/
theorem packet_card_le_groupSum
    {A : Finset ℝ²} (S : SurplusCapPacket A)
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
    have hqA : q ∈ A := (mem_selectedClass.mp hqsel).1
    rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hqA with
      hqv | ⟨j, hj⟩
    · exact Finset.mem_union_left _ (Finset.mem_union_left _ (Finset.mem_union_left _
        (Finset.mem_inter.mpr ⟨hq, hqv⟩)))
    · fin_cases j <;>
      simp only [capInteriorByIndex, leftAdjacentInteriorByIndex,
        rightAdjacentInteriorByIndex] at hj ⊢ <;>
      first
      | (refine Finset.mem_union_left _ (Finset.mem_union_left _ (Finset.mem_union_right _ ?_))
         exact Finset.mem_inter.mpr ⟨hq, Finset.mem_erase.mpr ⟨hqx, hj⟩⟩)
      | (refine Finset.mem_union_left _ (Finset.mem_union_right _ ?_)
         exact Finset.mem_inter.mpr ⟨hq, hj⟩)
      | (refine Finset.mem_union_right _ ?_
         exact Finset.mem_inter.mpr ⟨hq, hj⟩)

/-- The packet groups do not over-count a selected packet.  Moser vertices are
counted only in the Moser group, and each non-Moser selected point lies in at
most one of the three open cap interiors. -/
theorem packet_groupSum_le_card
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ} {T : Finset ℝ²}
    (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T ≤ T.card := by
  classical
  unfold packetMoserCount packetSameCapCount packetLeftAdjCount
    packetRightAdjCount
  rw [inter_card_eq_sum_indicator T S.triangle.verts]
  rw [inter_card_eq_sum_indicator T ((S.capInteriorByIndex i).erase x)]
  rw [inter_card_eq_sum_indicator T (S.leftAdjacentInteriorByIndex i)]
  rw [inter_card_eq_sum_indicator T (S.rightAdjacentInteriorByIndex i)]
  rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib,
    ← Finset.sum_add_distrib]
  rw [Finset.card_eq_sum_ones]
  apply Finset.sum_le_sum
  intro q hq
  have hqsel : q ∈ SelectedClass A x radius := hTsub hq
  by_cases hqv : q ∈ S.triangle.verts
  · have hnot0 : q ∉ S.capInteriorByIndex 0 := by
      intro hI
      exact S.capInteriorByIndex_not_mem_triangle_verts hI hqv
    have hnot1 : q ∉ S.capInteriorByIndex 1 := by
      intro hI
      exact S.capInteriorByIndex_not_mem_triangle_verts hI hqv
    have hnot2 : q ∉ S.capInteriorByIndex 2 := by
      intro hI
      exact S.capInteriorByIndex_not_mem_triangle_verts hI hqv
    fin_cases i <;>
      simp [hqv, hnot0, hnot1, hnot2]
  · have hqA : q ∈ A := (mem_selectedClass.mp hqsel).1
    have hone := S.partition.nonmoser_in_one q hqA hqv
    have hM0 : (if q ∈ S.triangle.verts then 1 else 0 : ℕ) = 0 := by
      simp [hqv]
    have hI0e :
        (if q ∈ (S.capInteriorByIndex 0).erase x then 1 else 0 : ℕ) ≤
          if q ∈ S.capByIndex 0 then 1 else 0 :=
      indicator_le_indicator_of_imp
        (fun h => S.capInteriorByIndex_subset_capByIndex 0
          (Finset.mem_of_mem_erase h))
    have hI1e :
        (if q ∈ (S.capInteriorByIndex 1).erase x then 1 else 0 : ℕ) ≤
          if q ∈ S.capByIndex 1 then 1 else 0 :=
      indicator_le_indicator_of_imp
        (fun h => S.capInteriorByIndex_subset_capByIndex 1
          (Finset.mem_of_mem_erase h))
    have hI2e :
        (if q ∈ (S.capInteriorByIndex 2).erase x then 1 else 0 : ℕ) ≤
          if q ∈ S.capByIndex 2 then 1 else 0 :=
      indicator_le_indicator_of_imp
        (fun h => S.capInteriorByIndex_subset_capByIndex 2
          (Finset.mem_of_mem_erase h))
    have hI0 :
        (if q ∈ S.capInteriorByIndex 0 then 1 else 0 : ℕ) ≤
          if q ∈ S.capByIndex 0 then 1 else 0 :=
      indicator_le_indicator_of_imp
        (fun h => S.capInteriorByIndex_subset_capByIndex 0 h)
    have hI1 :
        (if q ∈ S.capInteriorByIndex 1 then 1 else 0 : ℕ) ≤
          if q ∈ S.capByIndex 1 then 1 else 0 :=
      indicator_le_indicator_of_imp
        (fun h => S.capInteriorByIndex_subset_capByIndex 1 h)
    have hI2 :
        (if q ∈ S.capInteriorByIndex 2 then 1 else 0 : ℕ) ≤
          if q ∈ S.capByIndex 2 then 1 else 0 :=
      indicator_le_indicator_of_imp
        (fun h => S.capInteriorByIndex_subset_capByIndex 2 h)
    fin_cases i <;>
      simp only [capByIndex, capInteriorByIndex, leftAdjacentInteriorByIndex,
        rightAdjacentInteriorByIndex] at hI0e hI1e hI2e hI0 hI1 hI2 hone ⊢ <;>
      omega

/-- Exact packet incidence budget.  A positive-radius selected packet is
partitioned by the Moser, same-cap, left-adjacent, and right-adjacent groups. -/
theorem packet_groupSum_eq_card
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ} {T : Finset ℝ²}
    (hradius_pos : 0 < radius) (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = T.card := by
  exact le_antisymm (S.packet_groupSum_le_card i hTsub)
    (S.packet_card_le_groupSum i hradius_pos hTsub)

/-- A four-point selected packet has exact primitive incidence budget `4`. -/
theorem packet_groupSum_eq_four_of_card
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ} {T : Finset ℝ²}
    (hradius_pos : 0 < radius) (hTsub : T ⊆ SelectedClass A x radius)
    (hTcard : T.card = 4) :
    S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rw [S.packet_groupSum_eq_card i hradius_pos hTsub, hTcard]

/-- The four-point subpacket attached to an `M44SelectedApex` can be chosen
with the exact primitive incidence budget. -/
theorem M44SelectedApex.exists_fourSubpacket_with_packet_budget
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x : ℝ²}
    (hx : M44SelectedApex S i x) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rcases M44SelectedApex.exists_fourSubpacket hx with ⟨T, hTsub, hTcard⟩
  exact ⟨T, hTsub, hTcard,
    S.packet_groupSum_eq_four_of_card i hx.radius_pos hTsub hTcard⟩

/-- The four-point subpacket attached to an `M44SelectedApex` can preserve a
chosen selected point and still carry the exact primitive incidence budget. -/
theorem M44SelectedApex.exists_fourSubpacket_preserving_point_with_packet_budget
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x p : ℝ²}
    (hx : M44SelectedApex S i x)
    (hp : p ∈ SelectedClass A x hx.radius) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rcases M44SelectedApex.exists_fourSubpacket_preserving_point hx hp with
    ⟨T, hpT, hTsub, hTcard⟩
  exact ⟨T, hpT, hTsub, hTcard,
    S.packet_groupSum_eq_four_of_card i hx.radius_pos hTsub hTcard⟩

/-- A selected left-adjacent point can be preserved in a four-point packet,
where it contributes to the packet left-adjacent count. -/
theorem M44SelectedApex.exists_fourSubpacket_preserving_left_point_with_packet_budget
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x p : ℝ²}
    (hx : M44SelectedApex S i x)
    (hp : p ∈ SelectedClass A x hx.radius ∩ S.leftAdjacentInteriorByIndex i) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      1 ≤ S.packetLeftAdjCount i T ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rcases M44SelectedApex.exists_fourSubpacket_preserving_point_with_packet_budget
      hx (Finset.mem_of_mem_inter_left hp) with
    ⟨T, hpT, hTsub, hTcard, hbudget⟩
  exact ⟨T, hpT, hTsub, hTcard,
    S.one_le_packetLeftAdjCount_of_mem i hpT
      (Finset.mem_of_mem_inter_right hp),
    hbudget⟩

/-- A selected right-adjacent point can be preserved in a four-point packet,
where it contributes to the packet right-adjacent count. -/
theorem M44SelectedApex.exists_fourSubpacket_preserving_right_point_with_packet_budget
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x p : ℝ²}
    (hx : M44SelectedApex S i x)
    (hp : p ∈ SelectedClass A x hx.radius ∩ S.rightAdjacentInteriorByIndex i) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      1 ≤ S.packetRightAdjCount i T ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rcases M44SelectedApex.exists_fourSubpacket_preserving_point_with_packet_budget
      hx (Finset.mem_of_mem_inter_left hp) with
    ⟨T, hpT, hTsub, hTcard, hbudget⟩
  exact ⟨T, hpT, hTsub, hTcard,
    S.one_le_packetRightAdjCount_of_mem i hpT
      (Finset.mem_of_mem_inter_right hp),
    hbudget⟩

/-- Selected left- and right-adjacent points can be preserved together in a
four-point packet.  The resulting primitive row has nonzero left and right
adjacent counts and exact packet budget `4`. -/
theorem M44SelectedApex.exists_fourSubpacket_preserving_left_right_points_with_packet_budget
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {x pL pR : ℝ²}
    (hx : M44SelectedApex S i x)
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
    S.one_le_packetLeftAdjCount_of_mem i hpLT
      (Finset.mem_of_mem_inter_right hpL),
    S.one_le_packetRightAdjCount_of_mem i hpRT
      (Finset.mem_of_mem_inter_right hpR),
    S.packet_groupSum_eq_four_of_card i hx.radius_pos hTsub hTcard⟩

/-- Packet arithmetic with left and right singleton rows.  Under the exact
four-point budget, a Moser bound `m <= 2`, a same-cap bound `s <= 1`, and
left/right rows equal to `1`, only the two primitive rows `(1,1,1,1)` and
`(2,0,1,1)` remain. -/
theorem packet_left_right_primitive_cases
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
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

/-- A four-point selected class has exact full selected-count budget. -/
theorem selectedCount_groupSum_eq_four_of_card
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hcard : (SelectedClass A x radius).card = 4) :
    S.moserCount x radius + S.sameCapCount i x radius +
        S.leftAdjCount i x radius + S.rightAdjCount i x radius = 4 := by
  have hTsub : SelectedClass A x radius ⊆ SelectedClass A x radius := by
    intro q hq
    exact hq
  simpa [moserCount, sameCapCount, leftAdjCount, rightAdjCount,
    packetMoserCount, packetSameCapCount, packetLeftAdjCount,
    packetRightAdjCount] using
    S.packet_groupSum_eq_four_of_card
      (x := x) (i := i) (radius := radius)
      (T := SelectedClass A x radius) hradius_pos hTsub hcard

/-- A positive-radius selected class is partitioned by the Moser, same-cap,
left-adjacent, and right-adjacent count groups. -/
theorem selectedClass_card_eq_groupSum
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hradius_pos : 0 < radius) :
    (SelectedClass A x radius).card =
      S.moserCount x radius + S.sameCapCount i x radius +
        S.leftAdjCount i x radius + S.rightAdjCount i x radius := by
  have hTsub : SelectedClass A x radius ⊆ SelectedClass A x radius := by
    intro q hq
    exact hq
  simpa [moserCount, sameCapCount, leftAdjCount, rightAdjCount,
    packetMoserCount, packetSameCapCount, packetLeftAdjCount,
    packetRightAdjCount] using
    (S.packet_groupSum_eq_card
      (x := x) (i := i) (radius := radius)
      (T := SelectedClass A x radius) hradius_pos hTsub).symm

/-- One-sided right-adjacent count split.  If the right-adjacent count is the
known singleton but the left lower bound is not known, the exact four-count
budget leaves the two primitive rows or the single left-zero obstruction row. -/
theorem rightAdjCount_one_sided_count_cases
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    {radius : ℝ}
    (hbudget :
      S.moserCount x radius + S.sameCapCount i x radius +
        S.leftAdjCount i x radius + S.rightAdjCount i x radius = 4)
    (hm : S.moserCount x radius ≤ 2)
    (hs : S.sameCapCount i x radius ≤ 1)
    (hl : S.leftAdjCount i x radius ≤ 1)
    (hr_pos : 1 ≤ S.rightAdjCount i x radius)
    (hr : S.rightAdjCount i x radius ≤ 1) :
    (S.moserCount x radius = 1 ∧
      S.sameCapCount i x radius = 1 ∧
      S.leftAdjCount i x radius = 1 ∧
      S.rightAdjCount i x radius = 1) ∨
    (S.moserCount x radius = 2 ∧
      S.sameCapCount i x radius = 0 ∧
      S.leftAdjCount i x radius = 1 ∧
      S.rightAdjCount i x radius = 1) ∨
    (S.moserCount x radius = 2 ∧
      S.sameCapCount i x radius = 1 ∧
      S.leftAdjCount i x radius = 0 ∧
      S.rightAdjCount i x radius = 1) := by
  omega

/-- One-sided left-adjacent count split.  If the left-adjacent count is the
known singleton but the right lower bound is not known, the exact four-count
budget leaves the two primitive rows or the single right-zero obstruction row. -/
theorem leftAdjCount_one_sided_count_cases
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    {radius : ℝ}
    (hbudget :
      S.moserCount x radius + S.sameCapCount i x radius +
        S.leftAdjCount i x radius + S.rightAdjCount i x radius = 4)
    (hm : S.moserCount x radius ≤ 2)
    (hs : S.sameCapCount i x radius ≤ 1)
    (hl_pos : 1 ≤ S.leftAdjCount i x radius)
    (hl : S.leftAdjCount i x radius ≤ 1)
    (hr : S.rightAdjCount i x radius ≤ 1) :
    (S.moserCount x radius = 1 ∧
      S.sameCapCount i x radius = 1 ∧
      S.leftAdjCount i x radius = 1 ∧
      S.rightAdjCount i x radius = 1) ∨
    (S.moserCount x radius = 2 ∧
      S.sameCapCount i x radius = 0 ∧
      S.leftAdjCount i x radius = 1 ∧
      S.rightAdjCount i x radius = 1) ∨
    (S.moserCount x radius = 2 ∧
      S.sameCapCount i x radius = 1 ∧
      S.leftAdjCount i x radius = 1 ∧
      S.rightAdjCount i x radius = 0) := by
  omega

/-- Named payload for the one-sided row with no left-adjacent selected point. -/
def RightOneSidedObstructionPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (i : Fin 3) (x : ℝ²) (radius : ℝ) : Prop :=
  ∃ m₁ m₂ s r : ℝ²,
    m₁ ≠ m₂ ∧
    SelectedClass A x radius ∩ S.triangle.verts = ({m₁, m₂} : Finset ℝ²) ∧
    SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x =
      ({s} : Finset ℝ²) ∧
    SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i = ∅ ∧
    SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i =
      ({r} : Finset ℝ²) ∧
    SelectedClass A x radius = ({m₁, m₂, s, r} : Finset ℝ²) ∧
    ({m₁, m₂, s, r} : Finset ℝ²).card = 4

/-- Named payload for the one-sided row with no right-adjacent selected point. -/
def LeftOneSidedObstructionPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (i : Fin 3) (x : ℝ²) (radius : ℝ) : Prop :=
  ∃ m₁ m₂ s l : ℝ²,
    m₁ ≠ m₂ ∧
    SelectedClass A x radius ∩ S.triangle.verts = ({m₁, m₂} : Finset ℝ²) ∧
    SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x =
      ({s} : Finset ℝ²) ∧
    SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i =
      ({l} : Finset ℝ²) ∧
    SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i = ∅ ∧
    SelectedClass A x radius = ({m₁, m₂, s, l} : Finset ℝ²) ∧
    ({m₁, m₂, s, l} : Finset ℝ²).card = 4

/-- Right one-sided payload with the adjacent singleton identified as a
specified erased point. -/
def RightOneSidedErasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (i : Fin 3) (center erased : ℝ²) (radius : ℝ) : Prop :=
  ∃ m₁ m₂ s : ℝ²,
    m₁ ≠ m₂ ∧
    SelectedClass A center radius ∩ S.triangle.verts =
      ({m₁, m₂} : Finset ℝ²) ∧
    SelectedClass A center radius ∩ (S.capInteriorByIndex i).erase center =
      ({s} : Finset ℝ²) ∧
    SelectedClass A center radius ∩ S.leftAdjacentInteriorByIndex i = ∅ ∧
    SelectedClass A center radius ∩ S.rightAdjacentInteriorByIndex i =
      ({erased} : Finset ℝ²) ∧
    SelectedClass A center radius = ({m₁, m₂, s, erased} : Finset ℝ²) ∧
    ({m₁, m₂, s, erased} : Finset ℝ²).card = 4

/-- Left one-sided payload with the adjacent singleton identified as a
specified erased point. -/
def LeftOneSidedErasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (i : Fin 3) (center erased : ℝ²) (radius : ℝ) : Prop :=
  ∃ m₁ m₂ s : ℝ²,
    m₁ ≠ m₂ ∧
    SelectedClass A center radius ∩ S.triangle.verts =
      ({m₁, m₂} : Finset ℝ²) ∧
    SelectedClass A center radius ∩ (S.capInteriorByIndex i).erase center =
      ({s} : Finset ℝ²) ∧
    SelectedClass A center radius ∩ S.leftAdjacentInteriorByIndex i =
      ({erased} : Finset ℝ²) ∧
    SelectedClass A center radius ∩ S.rightAdjacentInteriorByIndex i = ∅ ∧
    SelectedClass A center radius = ({m₁, m₂, s, erased} : Finset ℝ²) ∧
    ({m₁, m₂, s, erased} : Finset ℝ²).card = 4

/-- The right-sided obstruction row names the whole four-point selected class:
two Moser vertices, one same-cap point, no left-adjacent point, and one
right-adjacent point. -/
theorem right_one_sided_obstruction_payload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hcard : (SelectedClass A x radius).card = 4)
    (hm : S.moserCount x radius = 2)
    (hs : S.sameCapCount i x radius = 1)
    (hl : S.leftAdjCount i x radius = 0)
    (hr : S.rightAdjCount i x radius = 1) :
    RightOneSidedObstructionPayload S i x radius := by
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
  have hLcard : L.card = 0 := by
    simpa [L, leftAdjCount] using hl
  have hLeq : L = ∅ := Finset.card_eq_zero.mp hLcard
  have hRcard : R.card = 1 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨r, hReq⟩ := Finset.card_eq_one.mp hRcard
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
      SelectedClass A x radius ⊆ ({m₁, m₂, s, r} : Finset ℝ²) := by
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
  have hrSel : r ∈ SelectedClass A x radius := by
    have hrR : r ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hrR).1
  have hselSuperset :
      ({m₁, m₂, s, r} : Finset ℝ²) ⊆ SelectedClass A x radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hm₁Sel
    · exact hm₂Sel
    · exact hsSel
    · exact hrSel
  have hseleq :
      SelectedClass A x radius = ({m₁, m₂, s, r} : Finset ℝ²) :=
    Finset.Subset.antisymm hselSubset hselSuperset
  have hnamedCard : ({m₁, m₂, s, r} : Finset ℝ²).card = 4 := by
    rw [← hseleq]
    exact hcard
  exact ⟨m₁, m₂, s, r, hm12, hMeq, hCeq, hLeq, hReq, hseleq, hnamedCard⟩

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

/-- Forget the erased-point refinement of a right one-sided payload. -/
theorem rightOneSidedObstructionPayload_of_erasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    RightOneSidedObstructionPayload S i center radius := by
  rcases hpayload with
    ⟨m₁, m₂, s, hmne, hM, hC, hL, hR, hsel, hcard⟩
  exact ⟨m₁, m₂, s, erased, hmne, hM, hC, hL, hR, hsel, hcard⟩

/-- Forget the erased-point refinement of a left one-sided payload. -/
theorem leftOneSidedObstructionPayload_of_erasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    LeftOneSidedObstructionPayload S i center radius := by
  rcases hpayload with
    ⟨m₁, m₂, s, hmne, hM, hC, hL, hR, hsel, hcard⟩
  exact ⟨m₁, m₂, s, erased, hmne, hM, hC, hL, hR, hsel, hcard⟩

/-- In a right-sided one-sided payload, the two Moser hits are either the
indexed cap's own endpoints, or the selected class contains the opposite Moser
vertex. -/
theorem rightOneSidedObstructionPayload_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : RightOneSidedObstructionPayload S i x radius) :
    ((S.leftOuterVertexByIndex i ∈ SelectedClass A x radius ∧
        S.rightOuterVertexByIndex i ∈ SelectedClass A x radius) ∨
      S.oppositeVertexByIndex i ∈ SelectedClass A x radius) := by
  rcases hpayload with
    ⟨m₁, m₂, _s, _r, hmne, hM, _hC, _hL, _hR, _hsel, _hcard⟩
  have hm₁I : m₁ ∈ SelectedClass A x radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₂I : m₂ ∈ SelectedClass A x radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₁Sel : m₁ ∈ SelectedClass A x radius :=
    (Finset.mem_inter.mp hm₁I).1
  have hm₂Sel : m₂ ∈ SelectedClass A x radius :=
    (Finset.mem_inter.mp hm₂I).1
  have hm₁Verts : m₁ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₁I).2
  have hm₂Verts : m₂ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₂I).2
  rcases S.triangle_pair_own_or_opposite i hm₁Verts hm₂Verts hmne with
    hown | hopp
  · left
    rcases hown with hown | hown
    · exact ⟨by simpa [← hown.1] using hm₁Sel,
        by simpa [← hown.2] using hm₂Sel⟩
    · exact ⟨by simpa [← hown.2] using hm₂Sel,
        by simpa [← hown.1] using hm₁Sel⟩
  · right
    rcases hopp with hopp | hopp
    · simpa [← hopp] using hm₁Sel
    · simpa [← hopp] using hm₂Sel

/-- Erased-payload version of
`rightOneSidedObstructionPayload_own_or_opposite`. -/
theorem rightOneSidedErasedPayload_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    ((S.leftOuterVertexByIndex i ∈ SelectedClass A center radius ∧
        S.rightOuterVertexByIndex i ∈ SelectedClass A center radius) ∨
      S.oppositeVertexByIndex i ∈ SelectedClass A center radius) :=
  S.rightOneSidedObstructionPayload_own_or_opposite i
    (S.rightOneSidedObstructionPayload_of_erasedPayload i hpayload)

/-- In a left-sided one-sided payload, the two Moser hits are either the
indexed cap's own endpoints, or the selected class contains the opposite Moser
vertex. -/
theorem leftOneSidedObstructionPayload_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : LeftOneSidedObstructionPayload S i x radius) :
    ((S.leftOuterVertexByIndex i ∈ SelectedClass A x radius ∧
        S.rightOuterVertexByIndex i ∈ SelectedClass A x radius) ∨
      S.oppositeVertexByIndex i ∈ SelectedClass A x radius) := by
  rcases hpayload with
    ⟨m₁, m₂, _s, _l, hmne, hM, _hC, _hL, _hR, _hsel, _hcard⟩
  have hm₁I : m₁ ∈ SelectedClass A x radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₂I : m₂ ∈ SelectedClass A x radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₁Sel : m₁ ∈ SelectedClass A x radius :=
    (Finset.mem_inter.mp hm₁I).1
  have hm₂Sel : m₂ ∈ SelectedClass A x radius :=
    (Finset.mem_inter.mp hm₂I).1
  have hm₁Verts : m₁ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₁I).2
  have hm₂Verts : m₂ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₂I).2
  rcases S.triangle_pair_own_or_opposite i hm₁Verts hm₂Verts hmne with
    hown | hopp
  · left
    rcases hown with hown | hown
    · exact ⟨by simpa [← hown.1] using hm₁Sel,
        by simpa [← hown.2] using hm₂Sel⟩
    · exact ⟨by simpa [← hown.2] using hm₂Sel,
        by simpa [← hown.1] using hm₁Sel⟩
  · right
    rcases hopp with hopp | hopp
    · simpa [← hopp] using hm₁Sel
    · simpa [← hopp] using hm₂Sel

/-- Erased-payload version of
`leftOneSidedObstructionPayload_own_or_opposite`. -/
theorem leftOneSidedErasedPayload_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    ((S.leftOuterVertexByIndex i ∈ SelectedClass A center radius ∧
        S.rightOuterVertexByIndex i ∈ SelectedClass A center radius) ∨
      S.oppositeVertexByIndex i ∈ SelectedClass A center radius) :=
  S.leftOneSidedObstructionPayload_own_or_opposite i
    (S.leftOneSidedObstructionPayload_of_erasedPayload i hpayload)

/-- To exclude a right erased one-sided payload, it is enough to exclude both
branches of its Moser-pair split. -/
theorem rightOneSidedErasedPayload_false_of_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hownFalse :
      S.leftOuterVertexByIndex i ∈ SelectedClass A center radius →
        S.rightOuterVertexByIndex i ∈ SelectedClass A center radius → False)
    (hoppositeFalse :
      S.oppositeVertexByIndex i ∈ SelectedClass A center radius → False)
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    False := by
  rcases S.rightOneSidedErasedPayload_own_or_opposite i hpayload with
    hown | hopp
  · exact hownFalse hown.1 hown.2
  · exact hoppositeFalse hopp

/-- To exclude a left erased one-sided payload, it is enough to exclude both
branches of its Moser-pair split. -/
theorem leftOneSidedErasedPayload_false_of_own_or_opposite
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hownFalse :
      S.leftOuterVertexByIndex i ∈ SelectedClass A center radius →
        S.rightOuterVertexByIndex i ∈ SelectedClass A center radius → False)
    (hoppositeFalse :
      S.oppositeVertexByIndex i ∈ SelectedClass A center radius → False)
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    False := by
  rcases S.leftOneSidedErasedPayload_own_or_opposite i hpayload with
    hown | hopp
  · exact hownFalse hown.1 hown.2
  · exact hoppositeFalse hopp

/-- If the first non-surplus interior has been named as `{p₁, p₂}`, then a
right one-sided erased payload centered at an arbitrary point of that interior
is reduced to the two named center cases. -/
theorem rightOneSidedErasedPayload_false_of_named_oppInterior1_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ p x : ℝ²} {radius : ℝ}
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hownPwFalse :
      RightOneSidedErasedPayload S S.oppIndex1 p₁ x radius →
        S.leftOuterVertexByIndex S.oppIndex1 ∈ SelectedClass A p₁ radius →
        S.rightOuterVertexByIndex S.oppIndex1 ∈ SelectedClass A p₁ radius →
        False)
    (hownPuFalse :
      RightOneSidedErasedPayload S S.oppIndex1 p₂ x radius →
        S.leftOuterVertexByIndex S.oppIndex1 ∈ SelectedClass A p₂ radius →
        S.rightOuterVertexByIndex S.oppIndex1 ∈ SelectedClass A p₂ radius →
        False)
    (hoppositePwFalse :
      RightOneSidedErasedPayload S S.oppIndex1 p₁ x radius →
        S.oppositeVertexByIndex S.oppIndex1 ∈ SelectedClass A p₁ radius →
        False)
    (hoppositePuFalse :
      RightOneSidedErasedPayload S S.oppIndex1 p₂ x radius →
        S.oppositeVertexByIndex S.oppIndex1 ∈ SelectedClass A p₂ radius →
        False)
    (hpayload : RightOneSidedErasedPayload S S.oppIndex1 p x radius) :
    False := by
  have hp_cases : p = p₁ ∨ p = p₂ := by
    have hp' : p ∈ ({p₁, p₂} : Finset ℝ²) := by
      simpa [hpair] using hp
    simpa using hp'
  rcases hp_cases with rfl | rfl
  · exact S.rightOneSidedErasedPayload_false_of_own_or_opposite S.oppIndex1
      (fun hleft hright => hownPwFalse hpayload hleft hright)
      (fun hopposite => hoppositePwFalse hpayload hopposite)
      hpayload
  · exact S.rightOneSidedErasedPayload_false_of_own_or_opposite S.oppIndex1
      (fun hleft hright => hownPuFalse hpayload hleft hright)
      (fun hopposite => hoppositePuFalse hpayload hopposite)
      hpayload

/-- If the second non-surplus interior has been named as `{p₁, p₂}`, then a
left one-sided erased payload centered at an arbitrary point of that interior is
reduced to the two named center cases. -/
theorem leftOneSidedErasedPayload_false_of_named_oppInterior2_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ p x : ℝ²} {radius : ℝ}
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hownPwFalse :
      LeftOneSidedErasedPayload S S.oppIndex2 p₁ x radius →
        S.leftOuterVertexByIndex S.oppIndex2 ∈ SelectedClass A p₁ radius →
        S.rightOuterVertexByIndex S.oppIndex2 ∈ SelectedClass A p₁ radius →
        False)
    (hownPuFalse :
      LeftOneSidedErasedPayload S S.oppIndex2 p₂ x radius →
        S.leftOuterVertexByIndex S.oppIndex2 ∈ SelectedClass A p₂ radius →
        S.rightOuterVertexByIndex S.oppIndex2 ∈ SelectedClass A p₂ radius →
        False)
    (hoppositePwFalse :
      LeftOneSidedErasedPayload S S.oppIndex2 p₁ x radius →
        S.oppositeVertexByIndex S.oppIndex2 ∈ SelectedClass A p₁ radius →
        False)
    (hoppositePuFalse :
      LeftOneSidedErasedPayload S S.oppIndex2 p₂ x radius →
        S.oppositeVertexByIndex S.oppIndex2 ∈ SelectedClass A p₂ radius →
        False)
    (hpayload : LeftOneSidedErasedPayload S S.oppIndex2 p x radius) :
    False := by
  have hp_cases : p = p₁ ∨ p = p₂ := by
    have hp' : p ∈ ({p₁, p₂} : Finset ℝ²) := by
      simpa [hpair] using hp
    simpa using hp'
  rcases hp_cases with rfl | rfl
  · exact S.leftOneSidedErasedPayload_false_of_own_or_opposite S.oppIndex2
      (fun hleft hright => hownPwFalse hpayload hleft hright)
      (fun hopposite => hoppositePwFalse hpayload hopposite)
      hpayload
  · exact S.leftOneSidedErasedPayload_false_of_own_or_opposite S.oppIndex2
      (fun hleft hright => hownPuFalse hpayload hleft hright)
      (fun hopposite => hoppositePuFalse hpayload hopposite)
      hpayload

/-- In the first non-surplus erased branch, if the `p`-centered payload also
selects the opposite Moser vertex, then its radius is exactly the
Moser-centered exact-cap radius supplied by non-surplus containment. -/
theorem IsM44.oppIndex1_exactCapClass_at_erasedPayload_oppositeRadius
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hp : p ∈ S.oppInterior1)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex1 ∈
        SelectedClass A p (dist p x)) :
    SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) (dist p x) =
      S.capByIndex S.oppIndex1 := by
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1
      hK4 hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨ρ, _hρpos, hρexact⟩
  have hpCap : p ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      (by simpa [oppInterior1] using hp)
  have hdistρ :
      dist (S.oppositeVertexByIndex S.oppIndex1) p = ρ :=
    S.dist_opposite_eq_of_mem_capByIndex_of_exact S.oppIndex1
      hρexact hpCap
  have hdistOpp :
      dist p (S.oppositeVertexByIndex S.oppIndex1) = dist p x :=
    (mem_selectedClass.mp hopposite).2
  have hρeq : ρ = dist p x := by
    calc
      ρ = dist (S.oppositeVertexByIndex S.oppIndex1) p := hdistρ.symm
      _ = dist p (S.oppositeVertexByIndex S.oppIndex1) := dist_comm _ _
      _ = dist p x := hdistOpp
  simpa [hρeq] using hρexact

/-- Mirror of
`IsM44.oppIndex1_exactCapClass_at_erasedPayload_oppositeRadius` for the second
non-surplus erased branch. -/
theorem IsM44.oppIndex2_exactCapClass_at_erasedPayload_oppositeRadius
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hp : p ∈ S.oppInterior2)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex2 ∈
        SelectedClass A p (dist p x)) :
    SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) (dist p x) =
      S.capByIndex S.oppIndex2 := by
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2
      hK4 hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨ρ, _hρpos, hρexact⟩
  have hpCap : p ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (by simpa [oppInterior2] using hp)
  have hdistρ :
      dist (S.oppositeVertexByIndex S.oppIndex2) p = ρ :=
    S.dist_opposite_eq_of_mem_capByIndex_of_exact S.oppIndex2
      hρexact hpCap
  have hdistOpp :
      dist p (S.oppositeVertexByIndex S.oppIndex2) = dist p x :=
    (mem_selectedClass.mp hopposite).2
  have hρeq : ρ = dist p x := by
    calc
      ρ = dist (S.oppositeVertexByIndex S.oppIndex2) p := hdistρ.symm
      _ = dist p (S.oppositeVertexByIndex S.oppIndex2) := dist_comm _ _
      _ = dist p x := hdistOpp
  simpa [hρeq] using hρexact

/-- First non-surplus erased-payload split with the opposite-Moser branch
strengthened to an exact Moser-centered cap class at the erased radius. -/
theorem IsM44.rightOneSidedErasedPayload_own_or_exactOpposite
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hp : p ∈ S.oppInterior1)
    (hpayload :
      RightOneSidedErasedPayload S S.oppIndex1 p x (dist p x)) :
    ((S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) ∧
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x)) ∨
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) (dist p x) =
        S.capByIndex S.oppIndex1) := by
  rcases S.rightOneSidedErasedPayload_own_or_opposite S.oppIndex1
      hpayload with
    hown | hopp
  · exact Or.inl hown
  · exact Or.inr
      (hM44.oppIndex1_exactCapClass_at_erasedPayload_oppositeRadius
        hK4 hcontain hp hopp)

/-- Second non-surplus erased-payload split with the opposite-Moser branch
strengthened to an exact Moser-centered cap class at the erased radius. -/
theorem IsM44.leftOneSidedErasedPayload_own_or_exactOpposite
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hp : p ∈ S.oppInterior2)
    (hpayload :
      LeftOneSidedErasedPayload S S.oppIndex2 p x (dist p x)) :
    ((S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) ∧
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x)) ∨
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) (dist p x) =
        S.capByIndex S.oppIndex2) := by
  rcases S.leftOneSidedErasedPayload_own_or_opposite S.oppIndex2
      hpayload with
    hown | hopp
  · exact Or.inl hown
  · exact Or.inr
      (hM44.oppIndex2_exactCapClass_at_erasedPayload_oppositeRadius
        hK4 hcontain hp hopp)

/-- To exclude a first non-surplus erased one-sided payload, it is enough to
exclude the own-endpoint branch and the strengthened exact-opposite branch. -/
theorem IsM44.rightOneSidedErasedPayload_false_of_own_or_exactOpposite
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hp : p ∈ S.oppInterior1)
    (hownFalse :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) →
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) → False)
    (hexactOppositeFalse :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) (dist p x) =
        S.capByIndex S.oppIndex1 → False)
    (hpayload :
      RightOneSidedErasedPayload S S.oppIndex1 p x (dist p x)) :
    False := by
  rcases hM44.rightOneSidedErasedPayload_own_or_exactOpposite
      hK4 hcontain hp hpayload with
    hown | hexact
  · exact hownFalse hown.1 hown.2
  · exact hexactOppositeFalse hexact

/-- Mirror consumer for the second non-surplus erased one-sided payload. -/
theorem IsM44.leftOneSidedErasedPayload_false_of_own_or_exactOpposite
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hp : p ∈ S.oppInterior2)
    (hownFalse :
      S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) →
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) → False)
    (hexactOppositeFalse :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) (dist p x) =
        S.capByIndex S.oppIndex2 → False)
    (hpayload :
      LeftOneSidedErasedPayload S S.oppIndex2 p x (dist p x)) :
    False := by
  rcases hM44.leftOneSidedErasedPayload_own_or_exactOpposite
      hK4 hcontain hp hpayload with
    hown | hexact
  · exact hownFalse hown.1 hown.2
  · exact hexactOppositeFalse hexact

/-- A selected class with chosen left and right adjacent witnesses has an exact
four-point primitive packet. -/
theorem M44SelectedApex.exists_left_right_primitive_packet_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {x pL pR : ℝ²}
    (hx : M44SelectedApex S i x)
    (hpL : pL ∈ SelectedClass A x hx.radius ∩ S.leftAdjacentInteriorByIndex i)
    (hpR : pR ∈ SelectedClass A x hx.radius ∩ S.rightAdjacentInteriorByIndex i)
    (hm : S.moserCount x hx.radius ≤ 2)
    (hs : S.sameCapCount i x hx.radius ≤ 1)
    (hl : S.leftAdjCount i x hx.radius ≤ 1)
    (hr : S.rightAdjCount i x hx.radius ≤ 1) :
    ∃ T : Finset ℝ²,
      pL ∈ T ∧
      pR ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount i x T = 1 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount i x T = 0 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1)) := by
  rcases
      M44SelectedApex.exists_fourSubpacket_preserving_left_right_points_with_packet_budget
        hx hpL hpR with
    ⟨T, hpLT, hpRT, hTsub, hTcard, hl_packet, hr_packet, hbudget⟩
  have hm_packet : S.packetMoserCount T ≤ 2 :=
    le_trans
      (S.packetMoserCount_le_moserCount
        (x := x) (radius := hx.radius) hTsub)
      hm
  have hs_packet : S.packetSameCapCount i x T ≤ 1 :=
    le_trans
      (S.packetSameCapCount_le_sameCapCount
        (x := x) (radius := hx.radius) i hTsub)
      hs
  have hl_packet_eq : S.packetLeftAdjCount i T = 1 :=
    S.packetLeftAdjCount_eq_one_of_le_one
      (x := x) (radius := hx.radius) i hTsub hl_packet hl
  have hr_packet_eq : S.packetRightAdjCount i T = 1 :=
    S.packetRightAdjCount_eq_one_of_le_one
      (x := x) (radius := hx.radius) i hTsub hr_packet hr
  have hcases :=
    packet_left_right_primitive_cases S hbudget hm_packet hs_packet
      hl_packet_eq hr_packet_eq
  exact ⟨T, hpLT, hpRT, hTsub, hTcard, hcases⟩

/-- Count-facing version of
`M44SelectedApex.exists_left_right_primitive_packet_cases`. -/
theorem M44SelectedApex.exists_left_right_primitive_packet_cases_of_counts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {x : ℝ²}
    (hx : M44SelectedApex S i x)
    (hl_pos : 1 ≤ S.leftAdjCount i x hx.radius)
    (hr_pos : 1 ≤ S.rightAdjCount i x hx.radius)
    (hm : S.moserCount x hx.radius ≤ 2)
    (hs : S.sameCapCount i x hx.radius ≤ 1)
    (hl : S.leftAdjCount i x hx.radius ≤ 1)
    (hr : S.rightAdjCount i x hx.radius ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount i x T = 1 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount i x T = 0 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1)) := by
  classical
  have hLpos :
      0 < (SelectedClass A x hx.radius ∩ S.leftAdjacentInteriorByIndex i).card := by
    have h :
        1 ≤ (SelectedClass A x hx.radius ∩
          S.leftAdjacentInteriorByIndex i).card := by
      simpa [leftAdjCount] using hl_pos
    omega
  have hRpos :
      0 < (SelectedClass A x hx.radius ∩
          S.rightAdjacentInteriorByIndex i).card := by
    have h :
        1 ≤ (SelectedClass A x hx.radius ∩
          S.rightAdjacentInteriorByIndex i).card := by
      simpa [rightAdjCount] using hr_pos
    omega
  rcases Finset.card_pos.mp hLpos with ⟨pL, hpL⟩
  rcases Finset.card_pos.mp hRpos with ⟨pR, hpR⟩
  rcases hx.exists_left_right_primitive_packet_cases hpL hpR hm hs hl hr with
    ⟨T, _hpLT, _hpRT, hTsub, hTcard, hcases⟩
  exact ⟨T, hTsub, hTcard, hcases⟩

/-- An erased-pin triple reconstructs the selected-apex packet needed by the
surplus primitive-row reducer. -/
noncomputable def M44SelectedApex.of_erasedPinTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {x p : ℝ²}
    (hxA : x ∈ A)
    (hpCap : p ∈ S.capInteriorByIndex i)
    (hcap : (S.capByIndex i).card = 4)
    (htriple : ErasedPinTriple A x p) :
    M44SelectedApex S i p :=
  { radius := dist p x
    radius_pos := (exact_erased_pin_of_erasedPinTriple hxA htriple).1
    cap_mem := hpCap
    cap_card := hcap
    selected_card :=
      Nat.le_of_eq
        (exact_erased_pin_of_erasedPinTriple hxA htriple).2.1.symm }

/-- Count-facing primitive-packet reduction directly from an erased-pin triple.
The hypotheses after `htriple` are exactly the full selected-class count
bounds used by
`M44SelectedApex.exists_left_right_primitive_packet_cases_of_counts`, evaluated
at the reconstructed radius `dist p x`. -/
theorem exists_left_right_primitive_packet_cases_of_erasedPinTriple_counts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {x p : ℝ²}
    (hxA : x ∈ A)
    (hpCap : p ∈ S.capInteriorByIndex i)
    (hcap : (S.capByIndex i).card = 4)
    (htriple : ErasedPinTriple A x p)
    (hl_pos : 1 ≤ S.leftAdjCount i p (dist p x))
    (hr_pos : 1 ≤ S.rightAdjCount i p (dist p x))
    (hm : S.moserCount p (dist p x) ≤ 2)
    (hs : S.sameCapCount i p (dist p x) ≤ 1)
    (hl : S.leftAdjCount i p (dist p x) ≤ 1)
    (hr : S.rightAdjCount i p (dist p x) ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount i p T = 1 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount i p T = 0 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1)) := by
  have hexact := exact_erased_pin_of_erasedPinTriple hxA htriple
  let hpApex : M44SelectedApex S i p :=
    { radius := dist p x
      radius_pos := hexact.1
      cap_mem := hpCap
      cap_card := hcap
      selected_card := Nat.le_of_eq hexact.2.1.symm }
  have hresult :=
    hpApex.exists_left_right_primitive_packet_cases_of_counts
      (by simpa [hpApex] using hl_pos)
      (by simpa [hpApex] using hr_pos)
      (by simpa [hpApex] using hm)
      (by simpa [hpApex] using hs)
      (by simpa [hpApex] using hl)
      (by simpa [hpApex] using hr)
  simpa [hpApex] using hresult

/-- Ordered-chain monotonicity supplies the two adjacent one-hit bounds for a
selected class in the surplus packet vocabulary. -/
theorem adjacentCount_le_one_of_adjacent_chains
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (x : ℝ²) (radius : ℝ) {mL mR : ℕ}
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict x L)
    (hmonoR : N8a3AdjacentCapDistanceStrict x R)
    (hsubL :
      (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i) ⊆
        L.support)
    (hsubR :
      (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i) ⊆
        R.support) :
    S.leftAdjCount i x radius ≤ 1 ∧
      S.rightAdjCount i x radius ≤ 1 := by
  simpa [leftAdjCount, rightAdjCount] using
    u2_selectedClass_adjacentCaps_one_hit x radius L R
      hmonoL hmonoR hsubL hsubR

/-- Aggregated ordered-chain data sufficient to prove both adjacent one-hit
upper bounds for a selected class.  This is the proof target for the remaining
N8a3 monotonicity/support realization work. -/
def AdjacentChainOneHitData
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (x : ℝ²) (radius : ℝ) : Prop :=
  ∃ mL mR : ℕ,
    ∃ L : FiniteEndpoint.OrderedSideChain mL,
    ∃ R : FiniteEndpoint.OrderedSideChain mR,
      N8a3AdjacentCapDistanceStrict x L ∧
      N8a3AdjacentCapDistanceStrict x R ∧
      (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i) ⊆
        L.support ∧
      (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i) ⊆
        R.support

/-- Aggregated-chain version of `adjacentCount_le_one_of_adjacent_chains`. -/
theorem adjacentCount_le_one_of_adjacent_chainData
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (x : ℝ²) (radius : ℝ)
    (hdata : S.AdjacentChainOneHitData i x radius) :
    S.leftAdjCount i x radius ≤ 1 ∧
      S.rightAdjCount i x radius ≤ 1 := by
  rcases hdata with
    ⟨mL, mR, L, R, hmonoL, hmonoR, hsubL, hsubR⟩
  exact S.adjacentCount_le_one_of_adjacent_chains i x radius L R
    hmonoL hmonoR hsubL hsubR

/-- A surplus-interior erased point is automatically counted on the
right-adjacent side of the first non-surplus cap. -/
theorem one_le_rightAdjCount_oppIndex1_of_surplus_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx) :
    1 ≤ S.rightAdjCount S.oppIndex1 p (dist p x) := by
  classical
  have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
  have hxSelected : x ∈ SelectedClass A p (dist p x) :=
    mem_selectedClass.mpr ⟨hxA, rfl⟩
  have hxRight : x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hpos :
      0 < (SelectedClass A p (dist p x) ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1).card :=
    Finset.card_pos.mpr
      ⟨x, Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩⟩
  have hcard :
      1 ≤ (SelectedClass A p (dist p x) ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1).card :=
    Nat.succ_le_of_lt hpos
  simpa [rightAdjCount] using hcard

/-- A surplus-interior erased point is automatically counted on the
left-adjacent side of the second non-surplus cap. -/
theorem one_le_leftAdjCount_oppIndex2_of_surplus_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx) :
    1 ≤ S.leftAdjCount S.oppIndex2 p (dist p x) := by
  classical
  have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
  have hxSelected : x ∈ SelectedClass A p (dist p x) :=
    mem_selectedClass.mpr ⟨hxA, rfl⟩
  have hxLeft : x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hpos :
      0 < (SelectedClass A p (dist p x) ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2).card :=
    Finset.card_pos.mpr
      ⟨x, Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩⟩
  have hcard :
      1 ≤ (SelectedClass A p (dist p x) ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2).card :=
    Nat.succ_le_of_lt hpos
  simpa [leftAdjCount] using hcard

/-- Chain-facing primitive-packet reduction directly from an erased-pin triple.
The ordered-chain hypotheses replace the raw adjacent one-hit upper bounds. -/
theorem exists_left_right_primitive_packet_cases_of_erasedPinTriple_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {x p : ℝ²} {mL mR : ℕ}
    (hxA : x ∈ A)
    (hpCap : p ∈ S.capInteriorByIndex i)
    (hcap : (S.capByIndex i).card = 4)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩ S.leftAdjacentInteriorByIndex i) ⊆
        L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩ S.rightAdjacentInteriorByIndex i) ⊆
        R.support)
    (hl_pos : 1 ≤ S.leftAdjCount i p (dist p x))
    (hr_pos : 1 ≤ S.rightAdjCount i p (dist p x))
    (hm : S.moserCount p (dist p x) ≤ 2)
    (hs : S.sameCapCount i p (dist p x) ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount i p T = 1 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount i p T = 0 ∧
          S.packetLeftAdjCount i T = 1 ∧
          S.packetRightAdjCount i T = 1)) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      i p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact S.exists_left_right_primitive_packet_cases_of_erasedPinTriple_counts
    hxA hpCap hcap htriple hl_pos hr_pos hm hs hl hr

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

/-- Under Moser-cap containment, the two non-surplus short caps are exact
Moser-centered distance classes at the common Moser side length.  This is the
local `SurplusCapPacket` analogue of the RVOL `U2FullDistanceClasses` payload
for the `(m,4,4)` branch. -/
theorem IsM44.exists_nonSurplus_exact_cap_classes_at_side_of_moserCapContainment
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment) :
    ∃ d : ℝ, 0 < d ∧
      dist S.triangle.v1 S.triangle.v2 = d ∧
      dist S.triangle.v2 S.triangle.v3 = d ∧
      dist S.triangle.v3 S.triangle.v1 = d ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) d =
        S.capByIndex S.oppIndex1 ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) d =
        S.capByIndex S.oppIndex2 := by
  rcases hM44.exists_oppInterior_side_placement_of_moserCapContainment
      hK4 hcontain with
    ⟨d, hdpos, h12, h23, h31, hopp1, hopp2⟩
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1 hK4
      hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨r1, _hr1, hexact1⟩
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2 hK4
      hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨r2, _hr2, hexact2⟩
  have hpos1 : 0 < S.oppInterior1.card := by
    rw [hM44.oppInterior1_card_eq_two]
    omega
  rcases Finset.card_pos.mp hpos1 with ⟨x1, hx1⟩
  have hx1I : x1 ∈ S.capInteriorByIndex S.oppIndex1 := by
    simpa [oppInterior1] using hx1
  have hx1Cap : x1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hx1I
  have hx1Sel : x1 ∈
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) r1 := by
    rw [hexact1]
    exact hx1Cap
  have hr1d : r1 = d :=
    (mem_selectedClass.mp hx1Sel).2.symm.trans (hopp1 x1 hx1)
  have hpos2 : 0 < S.oppInterior2.card := by
    rw [hM44.oppInterior2_card_eq_two]
    omega
  rcases Finset.card_pos.mp hpos2 with ⟨x2, hx2⟩
  have hx2I : x2 ∈ S.capInteriorByIndex S.oppIndex2 := by
    simpa [oppInterior2] using hx2
  have hx2Cap : x2 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx2I
  have hx2Sel : x2 ∈
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) r2 := by
    rw [hexact2]
    exact hx2Cap
  have hr2d : r2 = d :=
    (mem_selectedClass.mp hx2Sel).2.symm.trans (hopp2 x2 hx2)
  exact ⟨d, hdpos, h12, h23, h31, by simpa [hr1d] using hexact1,
    by simpa [hr2d] using hexact2⟩

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

/-- In the first non-surplus cap of an `IsM44` packet, an erased-pin triple
reduces to the two primitive packet rows once the adjacent full-count bounds
are supplied. -/
theorem IsM44.exists_oppIndex1_primitive_packet_cases_of_erasedPinTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hxA : x ∈ A)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (hl_pos : 1 ≤ S.leftAdjCount S.oppIndex1 p (dist p x))
    (hr_pos : 1 ≤ S.rightAdjCount S.oppIndex1 p (dist p x))
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1)) := by
  have hpCap : p ∈ S.capInteriorByIndex S.oppIndex1 := by
    simpa [oppInterior1] using hp
  exact S.exists_left_right_primitive_packet_cases_of_erasedPinTriple_counts
    hxA hpCap hM44.oppIndex1_cap_card_eq_four htriple
    hl_pos hr_pos
    (hM44.moserCount_oppIndex1_le_two_of_moserCapContainment
      hK4 hcontain hp (dist p x))
    (hM44.sameCapCount_oppIndex1_le_one (dist p x) hp)
    hl hr

/-- In the second non-surplus cap of an `IsM44` packet, an erased-pin triple
reduces to the two primitive packet rows once the adjacent full-count bounds
are supplied. -/
theorem IsM44.exists_oppIndex2_primitive_packet_cases_of_erasedPinTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hxA : x ∈ A)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (hl_pos : 1 ≤ S.leftAdjCount S.oppIndex2 p (dist p x))
    (hr_pos : 1 ≤ S.rightAdjCount S.oppIndex2 p (dist p x))
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1)) := by
  have hpCap : p ∈ S.capInteriorByIndex S.oppIndex2 := by
    simpa [oppInterior2] using hp
  exact S.exists_left_right_primitive_packet_cases_of_erasedPinTriple_counts
    hxA hpCap hM44.oppIndex2_cap_card_eq_four htriple
    hl_pos hr_pos
    (hM44.moserCount_oppIndex2_le_two_of_moserCapContainment
      hK4 hcontain hp (dist p x))
    (hM44.sameCapCount_oppIndex2_le_one (dist p x) hp)
    hl hr

/-- In the first non-surplus cap, the erased surplus point supplies the
right-adjacent lower count automatically. -/
theorem IsM44.exists_oppIndex1_primitive_packet_cases_of_surplus_erasedPinTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (hl_pos : 1 ≤ S.leftAdjCount S.oppIndex1 p (dist p x))
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1)) := by
  exact hM44.exists_oppIndex1_primitive_packet_cases_of_erasedPinTriple
    hK4 hcontain
    (S.capInteriorByIndex_subset S.surplusIdx hx)
    hp htriple hl_pos
    (S.one_le_rightAdjCount_oppIndex1_of_surplus_mem hx)
    hl hr

/-- In the second non-surplus cap, the erased surplus point supplies the
left-adjacent lower count automatically. -/
theorem IsM44.exists_oppIndex2_primitive_packet_cases_of_surplus_erasedPinTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (hr_pos : 1 ≤ S.rightAdjCount S.oppIndex2 p (dist p x))
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) ≤ 1) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1)) := by
  exact hM44.exists_oppIndex2_primitive_packet_cases_of_erasedPinTriple
    hK4 hcontain
    (S.capInteriorByIndex_subset S.surplusIdx hx)
    hp htriple
    (S.one_le_leftAdjCount_oppIndex2_of_surplus_mem hx)
    hr_pos hl hr

/-- First non-surplus erased-pin split after the surplus point supplies the
right-adjacent hit.  The branch either reaches the two primitive packet rows or
the single full-count obstruction `(2,1,0,1)`. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) ≤ 1) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1))) ∨
      (S.moserCount p (dist p x) = 2 ∧
        S.sameCapCount S.oppIndex1 p (dist p x) = 1 ∧
        S.leftAdjCount S.oppIndex1 p (dist p x) = 0 ∧
        S.rightAdjCount S.oppIndex1 p (dist p x) = 1) := by
  have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
  have hexact := exact_erased_pin_of_erasedPinTriple hxA htriple
  have hbudget :
      S.moserCount p (dist p x) +
          S.sameCapCount S.oppIndex1 p (dist p x) +
          S.leftAdjCount S.oppIndex1 p (dist p x) +
          S.rightAdjCount S.oppIndex1 p (dist p x) = 4 :=
    S.selectedCount_groupSum_eq_four_of_card S.oppIndex1
      hexact.1 hexact.2.1
  have hm :
      S.moserCount p (dist p x) ≤ 2 :=
    hM44.moserCount_oppIndex1_le_two_of_moserCapContainment
      hK4 hcontain hp (dist p x)
  have hs :
      S.sameCapCount S.oppIndex1 p (dist p x) ≤ 1 :=
    hM44.sameCapCount_oppIndex1_le_one (dist p x) hp
  have hr_pos :
      1 ≤ S.rightAdjCount S.oppIndex1 p (dist p x) :=
    S.one_le_rightAdjCount_oppIndex1_of_surplus_mem hx
  have hcases :=
    S.rightAdjCount_one_sided_count_cases hbudget hm hs hl hr_pos hr
  rcases hcases with hrow | hrow | hobstruction
  · left
    have hl_pos :
        1 ≤ S.leftAdjCount S.oppIndex1 p (dist p x) := by omega
    exact hM44.exists_oppIndex1_primitive_packet_cases_of_surplus_erasedPinTriple
      hK4 hcontain hx hp htriple hl_pos hl hr
  · left
    have hl_pos :
        1 ≤ S.leftAdjCount S.oppIndex1 p (dist p x) := by omega
    exact hM44.exists_oppIndex1_primitive_packet_cases_of_surplus_erasedPinTriple
      hK4 hcontain hx hp htriple hl_pos hl hr
  · right
    exact hobstruction

/-- Second non-surplus erased-pin split after the surplus point supplies the
left-adjacent hit.  The branch either reaches the two primitive packet rows or
the single full-count obstruction `(2,1,1,0)`. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) ≤ 1) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1))) ∨
      (S.moserCount p (dist p x) = 2 ∧
        S.sameCapCount S.oppIndex2 p (dist p x) = 1 ∧
        S.leftAdjCount S.oppIndex2 p (dist p x) = 1 ∧
        S.rightAdjCount S.oppIndex2 p (dist p x) = 0) := by
  have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
  have hexact := exact_erased_pin_of_erasedPinTriple hxA htriple
  have hbudget :
      S.moserCount p (dist p x) +
          S.sameCapCount S.oppIndex2 p (dist p x) +
          S.leftAdjCount S.oppIndex2 p (dist p x) +
          S.rightAdjCount S.oppIndex2 p (dist p x) = 4 :=
    S.selectedCount_groupSum_eq_four_of_card S.oppIndex2
      hexact.1 hexact.2.1
  have hm :
      S.moserCount p (dist p x) ≤ 2 :=
    hM44.moserCount_oppIndex2_le_two_of_moserCapContainment
      hK4 hcontain hp (dist p x)
  have hs :
      S.sameCapCount S.oppIndex2 p (dist p x) ≤ 1 :=
    hM44.sameCapCount_oppIndex2_le_one (dist p x) hp
  have hl_pos :
      1 ≤ S.leftAdjCount S.oppIndex2 p (dist p x) :=
    S.one_le_leftAdjCount_oppIndex2_of_surplus_mem hx
  have hcases :=
    S.leftAdjCount_one_sided_count_cases hbudget hm hs hl_pos hl hr
  rcases hcases with hrow | hrow | hobstruction
  · left
    have hr_pos :
        1 ≤ S.rightAdjCount S.oppIndex2 p (dist p x) := by omega
    exact hM44.exists_oppIndex2_primitive_packet_cases_of_surplus_erasedPinTriple
      hK4 hcontain hx hp htriple hr_pos hl hr
  · left
    have hr_pos :
        1 ≤ S.rightAdjCount S.oppIndex2 p (dist p x) := by omega
    exact hM44.exists_oppIndex2_primitive_packet_cases_of_surplus_erasedPinTriple
      hK4 hcontain hx hp htriple hr_pos hl hr
  · right
    exact hobstruction

/-- First non-surplus erased-pin split with the obstruction branch packaged as
a named four-point selected-class payload. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_payload_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) ≤ 1) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1))) ∨
      RightOneSidedObstructionPayload S S.oppIndex1 p (dist p x) := by
  rcases hM44.oppIndex1_surplusErasedPinTriple_cases
      hK4 hcontain hx hp htriple hl hr with
    hprimitive | hobstruction
  · exact Or.inl hprimitive
  · right
    have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
    have hexact := exact_erased_pin_of_erasedPinTriple hxA htriple
    exact S.right_one_sided_obstruction_payload S.oppIndex1
      hexact.1 hexact.2.1
      hobstruction.1 hobstruction.2.1 hobstruction.2.2.1
      hobstruction.2.2.2

/-- Second non-surplus erased-pin split with the obstruction branch packaged as
a named four-point selected-class payload. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_payload_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) ≤ 1) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1))) ∨
      LeftOneSidedObstructionPayload S S.oppIndex2 p (dist p x) := by
  rcases hM44.oppIndex2_surplusErasedPinTriple_cases
      hK4 hcontain hx hp htriple hl hr with
    hprimitive | hobstruction
  · exact Or.inl hprimitive
  · right
    have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
    have hexact := exact_erased_pin_of_erasedPinTriple hxA htriple
    exact S.left_one_sided_obstruction_payload S.oppIndex2
      hexact.1 hexact.2.1
      hobstruction.1 hobstruction.2.1 hobstruction.2.2.1
      hobstruction.2.2.2

/-- Chain-facing first non-surplus-cap erased-pin reducer.  The ordered-chain
inputs supply the adjacent one-hit upper bounds. -/
theorem IsM44.exists_oppIndex1_primitive_packet_cases_of_erasedPinTriple_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hxA : x ∈ A)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1) ⊆ R.support)
    (hl_pos : 1 ≤ S.leftAdjCount S.oppIndex1 p (dist p x))
    (hr_pos : 1 ≤ S.rightAdjCount S.oppIndex1 p (dist p x)) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1)) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex1 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.exists_oppIndex1_primitive_packet_cases_of_erasedPinTriple
    hK4 hcontain hxA hp htriple hl_pos hr_pos hl hr

/-- Chain-facing second non-surplus-cap erased-pin reducer.  The ordered-chain
inputs supply the adjacent one-hit upper bounds. -/
theorem IsM44.exists_oppIndex2_primitive_packet_cases_of_erasedPinTriple_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hxA : x ∈ A)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2) ⊆ R.support)
    (hl_pos : 1 ≤ S.leftAdjCount S.oppIndex2 p (dist p x))
    (hr_pos : 1 ≤ S.rightAdjCount S.oppIndex2 p (dist p x)) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1)) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex2 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.exists_oppIndex2_primitive_packet_cases_of_erasedPinTriple
    hK4 hcontain hxA hp htriple hl_pos hr_pos hl hr

/-- Chain-facing first non-surplus-cap erased-pin reducer with the erased
surplus point supplying the right-adjacent lower count. -/
theorem
    IsM44.exists_oppIndex1_primitive_packet_cases_of_surplus_erasedPinTriple_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1) ⊆ R.support)
    (hl_pos : 1 ≤ S.leftAdjCount S.oppIndex1 p (dist p x)) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1)) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex1 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.exists_oppIndex1_primitive_packet_cases_of_surplus_erasedPinTriple
    hK4 hcontain hx hp htriple hl_pos hl hr

/-- Chain-facing second non-surplus-cap erased-pin reducer with the erased
surplus point supplying the left-adjacent lower count. -/
theorem
    IsM44.exists_oppIndex2_primitive_packet_cases_of_surplus_erasedPinTriple_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2) ⊆ R.support)
    (hr_pos : 1 ≤ S.rightAdjCount S.oppIndex2 p (dist p x)) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1)) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex2 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.exists_oppIndex2_primitive_packet_cases_of_surplus_erasedPinTriple
    hK4 hcontain hx hp htriple hr_pos hl hr

/-- Chain-facing first non-surplus erased-pin split.  The ordered-chain
one-hit bounds reduce the branch to primitive packet rows or the single
left-zero full-count obstruction `(2,1,0,1)`. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_cases_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1) ⊆ R.support) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1))) ∨
      (S.moserCount p (dist p x) = 2 ∧
        S.sameCapCount S.oppIndex1 p (dist p x) = 1 ∧
        S.leftAdjCount S.oppIndex1 p (dist p x) = 0 ∧
        S.rightAdjCount S.oppIndex1 p (dist p x) = 1) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex1 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.oppIndex1_surplusErasedPinTriple_cases
    hK4 hcontain hx hp htriple hl hr

/-- Chain-facing second non-surplus erased-pin split.  The ordered-chain
one-hit bounds reduce the branch to primitive packet rows or the single
right-zero full-count obstruction `(2,1,1,0)`. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_cases_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2) ⊆ R.support) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1))) ∨
      (S.moserCount p (dist p x) = 2 ∧
        S.sameCapCount S.oppIndex2 p (dist p x) = 1 ∧
        S.leftAdjCount S.oppIndex2 p (dist p x) = 1 ∧
        S.rightAdjCount S.oppIndex2 p (dist p x) = 0) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex2 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.oppIndex2_surplusErasedPinTriple_cases
    hK4 hcontain hx hp htriple hl hr

/-- Chain-facing first non-surplus erased-pin split, returning a named
one-sided payload instead of raw obstruction counts. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_payload_cases_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1) ⊆ R.support) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1))) ∨
      RightOneSidedObstructionPayload S S.oppIndex1 p (dist p x) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex1 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.oppIndex1_surplusErasedPinTriple_payload_cases
    hK4 hcontain hx hp htriple hl hr

/-- Chain-facing second non-surplus erased-pin split, returning a named
one-sided payload instead of raw obstruction counts. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_payload_cases_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2) ⊆ R.support) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1))) ∨
      LeftOneSidedObstructionPayload S S.oppIndex2 p (dist p x) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex2 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.oppIndex2_surplusErasedPinTriple_payload_cases
    hK4 hcontain hx hp htriple hl hr

/-- Aggregated-chain-data first non-surplus erased-pin split, returning a
primitive row or the named one-sided payload. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_payload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex1 p (dist p x)) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1))) ∨
      RightOneSidedObstructionPayload S S.oppIndex1 p (dist p x) := by
  rcases hdata with
    ⟨mL, mR, L, R, hmonoL, hmonoR, hsubL, hsubR⟩
  exact hM44.oppIndex1_surplusErasedPinTriple_payload_cases_chains
    hK4 hcontain hx hp htriple L R hmonoL hmonoR hsubL hsubR

/-- Aggregated-chain-data second non-surplus erased-pin split, returning a
primitive row or the named one-sided payload. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_payload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex2 p (dist p x)) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1))) ∨
      LeftOneSidedObstructionPayload S S.oppIndex2 p (dist p x) := by
  rcases hdata with
    ⟨mL, mR, L, R, hmonoL, hmonoR, hsubL, hsubR⟩
  exact hM44.oppIndex2_surplusErasedPinTriple_payload_cases_chains
    hK4 hcontain hx hp htriple L R hmonoL hmonoR hsubL hsubR

/-- Aggregated-chain-data first non-surplus erased-pin split, returning a
primitive row or the one-sided payload with the erased point identified as the
right-adjacent singleton. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_erasedPayload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex1 p (dist p x)) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1))) ∨
      RightOneSidedErasedPayload S S.oppIndex1 p x (dist p x) := by
  rcases hM44.oppIndex1_surplusErasedPinTriple_payload_cases_chainData
      hK4 hcontain hx hp htriple hdata with
    hprimitive | hpayload
  · exact Or.inl hprimitive
  · exact Or.inr
      (S.rightOneSidedErasedPayload_of_oppIndex1_surplus_mem hx hpayload)

/-- Aggregated-chain-data second non-surplus erased-pin split, returning a
primitive row or the one-sided payload with the erased point identified as the
left-adjacent singleton. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_erasedPayload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex2 p (dist p x)) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1))) ∨
      LeftOneSidedErasedPayload S S.oppIndex2 p x (dist p x) := by
  rcases hM44.oppIndex2_surplusErasedPinTriple_payload_cases_chainData
      hK4 hcontain hx hp htriple hdata with
    hprimitive | hpayload
  · exact Or.inl hprimitive
  · exact Or.inr
      (S.leftOneSidedErasedPayload_of_oppIndex2_surplus_mem hx hpayload)

/-- Consumer form for the first non-surplus erased-pin branch: primitive-row
and one-sided-payload exclusions refute the erased-pin triple. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_payload_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) ≤ 1)
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex1 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex1 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1)) → False)
    (hpayloadFalse :
      RightOneSidedObstructionPayload S S.oppIndex1 p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hM44.oppIndex1_surplusErasedPinTriple_payload_cases
      hK4 hcontain hx hp htriple hl hr with
    hprimitive | hpayload
  · rcases hprimitive with ⟨T, hTsub, hTcard, hrows⟩
    exact hprimitiveFalse hTsub hTcard hrows
  · exact hpayloadFalse hpayload

/-- Consumer form for the second non-surplus erased-pin branch: primitive-row
and one-sided-payload exclusions refute the erased-pin triple. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_payload_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) ≤ 1)
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex2 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex2 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1)) → False)
    (hpayloadFalse :
      LeftOneSidedObstructionPayload S S.oppIndex2 p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hM44.oppIndex2_surplusErasedPinTriple_payload_cases
      hK4 hcontain hx hp htriple hl hr with
    hprimitive | hpayload
  · rcases hprimitive with ⟨T, hTsub, hTcard, hrows⟩
    exact hprimitiveFalse hTsub hTcard hrows
  · exact hpayloadFalse hpayload

/-- Chain-facing consumer form for the first non-surplus erased-pin branch. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_payload_cases_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1) ⊆ R.support)
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex1 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex1 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1)) → False)
    (hpayloadFalse :
      RightOneSidedObstructionPayload S S.oppIndex1 p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hM44.oppIndex1_surplusErasedPinTriple_payload_cases_chains
      hK4 hcontain hx hp htriple L R hmonoL hmonoR hsubL hsubR with
    hprimitive | hpayload
  · rcases hprimitive with ⟨T, hTsub, hTcard, hrows⟩
    exact hprimitiveFalse hTsub hTcard hrows
  · exact hpayloadFalse hpayload

/-- Chain-facing consumer form for the second non-surplus erased-pin branch. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_payload_cases_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2) ⊆ R.support)
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex2 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex2 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1)) → False)
    (hpayloadFalse :
      LeftOneSidedObstructionPayload S S.oppIndex2 p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hM44.oppIndex2_surplusErasedPinTriple_payload_cases_chains
      hK4 hcontain hx hp htriple L R hmonoL hmonoR hsubL hsubR with
    hprimitive | hpayload
  · rcases hprimitive with ⟨T, hTsub, hTcard, hrows⟩
    exact hprimitiveFalse hTsub hTcard hrows
  · exact hpayloadFalse hpayload

/-- Aggregated-chain-data consumer form for the first non-surplus erased-pin
branch. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_payload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex1 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex1 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex1 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1)) → False)
    (hpayloadFalse :
      RightOneSidedObstructionPayload S S.oppIndex1 p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hdata with
    ⟨mL, mR, L, R, hmonoL, hmonoR, hsubL, hsubR⟩
  exact hM44.oppIndex1_surplusErasedPinTriple_false_of_payload_cases_chains
    hK4 hcontain hx hp L R hmonoL hmonoR hsubL hsubR
    hprimitiveFalse hpayloadFalse htriple

/-- Aggregated-chain-data consumer form for the second non-surplus erased-pin
branch. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_payload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex2 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex2 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex2 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1)) → False)
    (hpayloadFalse :
      LeftOneSidedObstructionPayload S S.oppIndex2 p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hdata with
    ⟨mL, mR, L, R, hmonoL, hmonoR, hsubL, hsubR⟩
  exact hM44.oppIndex2_surplusErasedPinTriple_false_of_payload_cases_chains
    hK4 hcontain hx hp L R hmonoL hmonoR hsubL hsubR
    hprimitiveFalse hpayloadFalse htriple

/-- Aggregated-chain-data consumer form for the first non-surplus erased-pin
branch, using the stronger erased-point one-sided payload. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_erasedPayload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex1 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex1 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex1 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1)) → False)
    (hpayloadFalse :
      RightOneSidedErasedPayload S S.oppIndex1 p x (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hM44.oppIndex1_surplusErasedPinTriple_erasedPayload_cases_chainData
      hK4 hcontain hx hp htriple hdata with
    hprimitive | hpayload
  · rcases hprimitive with ⟨T, hTsub, hTcard, hrows⟩
    exact hprimitiveFalse hTsub hTcard hrows
  · exact hpayloadFalse hpayload

/-- Aggregated-chain-data consumer form for the second non-surplus erased-pin
branch, using the stronger erased-point one-sided payload. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_erasedPayload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex2 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex2 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex2 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1)) → False)
    (hpayloadFalse :
      LeftOneSidedErasedPayload S S.oppIndex2 p x (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hM44.oppIndex2_surplusErasedPinTriple_erasedPayload_cases_chainData
      hK4 hcontain hx hp htriple hdata with
    hprimitive | hpayload
  · rcases hprimitive with ⟨T, hTsub, hTcard, hrows⟩
    exact hprimitiveFalse hTsub hTcard hrows
  · exact hpayloadFalse hpayload

/-- Aggregated-chain-data consumer for the first non-surplus erased-pin branch,
with the one-sided erased payload split into own-endpoint and opposite-Moser
subcases. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_erasedPayload_split_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex1 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex1 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex1 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1)) → False)
    (hownFalse :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) →
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) → False)
    (hoppositeFalse :
      S.oppositeVertexByIndex S.oppIndex1 ∈
        SelectedClass A p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False :=
  hM44.oppIndex1_surplusErasedPinTriple_false_of_erasedPayload_cases_chainData
    hK4 hcontain hx hp hdata hprimitiveFalse
    (fun hpayload =>
      S.rightOneSidedErasedPayload_false_of_own_or_opposite S.oppIndex1
        hownFalse hoppositeFalse hpayload)
    htriple

/-- Aggregated-chain-data consumer for the second non-surplus erased-pin branch,
with the one-sided erased payload split into own-endpoint and opposite-Moser
subcases. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_erasedPayload_split_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex2 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex2 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex2 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1)) → False)
    (hownFalse :
      S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) →
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) → False)
    (hoppositeFalse :
      S.oppositeVertexByIndex S.oppIndex2 ∈
        SelectedClass A p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False :=
  hM44.oppIndex2_surplusErasedPinTriple_false_of_erasedPayload_cases_chainData
    hK4 hcontain hx hp hdata hprimitiveFalse
    (fun hpayload =>
      S.leftOneSidedErasedPayload_false_of_own_or_opposite S.oppIndex2
        hownFalse hoppositeFalse hpayload)
    htriple

/-- Aggregated-chain-data consumer for the first non-surplus erased-pin branch,
with the one-sided erased payload split into own-endpoint and exact-opposite
cap-class subcases. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_erasedPayload_exact_split_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex1 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex1 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex1 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1)) → False)
    (hownFalse :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) →
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) → False)
    (hexactOppositeFalse :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) (dist p x) =
        S.capByIndex S.oppIndex1 → False)
    (htriple : ErasedPinTriple A x p) :
    False :=
  hM44.oppIndex1_surplusErasedPinTriple_false_of_erasedPayload_cases_chainData
    hK4 hcontain hx hp hdata hprimitiveFalse
    (fun hpayload =>
      hM44.rightOneSidedErasedPayload_false_of_own_or_exactOpposite
        hK4 hcontain hp hownFalse hexactOppositeFalse hpayload)
    htriple

/-- Aggregated-chain-data consumer for the second non-surplus erased-pin
branch, with the one-sided erased payload split into own-endpoint and
exact-opposite cap-class subcases. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_erasedPayload_exact_split_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex2 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex2 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex2 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1)) → False)
    (hownFalse :
      S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) →
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) → False)
    (hexactOppositeFalse :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) (dist p x) =
        S.capByIndex S.oppIndex2 → False)
    (htriple : ErasedPinTriple A x p) :
    False :=
  hM44.oppIndex2_surplusErasedPinTriple_false_of_erasedPayload_cases_chainData
    hK4 hcontain hx hp hdata hprimitiveFalse
    (fun hpayload =>
      hM44.leftOneSidedErasedPayload_false_of_own_or_exactOpposite
        hK4 hcontain hp hownFalse hexactOppositeFalse hpayload)
    htriple

end SurplusCapPacket

end Problem97
