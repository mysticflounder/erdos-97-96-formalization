/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U2SqueezePort
import Erdos9796Proof.P97.U2SameDistanceArcContainment
import Erdos9796Proof.P97.N9Endpoint.N4a
import Erdos9796Proof.P97.CircumscribedMECPacket
import Erdos9796Proof.P97.SurplusM44Packet
import Erdos9796Proof.P97.U2.WitnessReflectionKernel

/-!
# U2 non-surplus one-hit inputs

This file proves the adjacent-cap one-hit bounds consumed by
`U2NonSurplusSqueeze`.  The input is the existing endpoint support-cap theorem
from `N9Endpoint/N4a`: a same-radius subset of a support cap, measured from one
of that cap's Moser endpoints, has cardinality at most one.

The result is still only the non-surplus squeeze package, not the final
`U2FullDistanceClasses` cap-containment theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U2NonSurplusSqueeze

noncomputable section

private def triangle231 (D : CounterexampleData) : MoserTriangle D.A := {
  v1 := D.packet.triangle.v2
  v2 := D.packet.triangle.v3
  v3 := D.packet.triangle.v1
  v1_mem := D.packet.triangle.v2_mem
  v2_mem := D.packet.triangle.v3_mem
  v3_mem := D.packet.triangle.v1_mem
  v12_ne := D.packet.triangle.v23_ne
  v13_ne := Ne.symm D.packet.triangle.v12_ne
  v23_ne := Ne.symm D.packet.triangle.v13_ne
}

private def triangle312 (D : CounterexampleData) : MoserTriangle D.A := {
  v1 := D.packet.triangle.v3
  v2 := D.packet.triangle.v1
  v3 := D.packet.triangle.v2
  v1_mem := D.packet.triangle.v3_mem
  v2_mem := D.packet.triangle.v1_mem
  v3_mem := D.packet.triangle.v2_mem
  v12_ne := Ne.symm D.packet.triangle.v13_ne
  v13_ne := Ne.symm D.packet.triangle.v23_ne
  v23_ne := D.packet.triangle.v12_ne
}

private def baseMecPacket (D : CounterexampleData) :
    CircumscribedMECPacket D.A D.packet.triangle :=
  CircumscribedMECPacket.ofNonObtuse D.packet.triangleNonObtuse D.packet.hCirc

private def mecPacket231 (D : CounterexampleData) :
    CircumscribedMECPacket D.A (triangle231 D) := {
  center := (baseMecPacket D).center
  radius := (baseMecPacket D).radius
  radius_pos := (baseMecPacket D).radius_pos
  moser_on_boundary_1 := by
    simpa [triangle231] using (baseMecPacket D).moser_on_boundary_2
  moser_on_boundary_2 := by
    simpa [triangle231] using (baseMecPacket D).moser_on_boundary_3
  moser_on_boundary_3 := by
    simpa [triangle231] using (baseMecPacket D).moser_on_boundary_1
  inner_at_v1 := by
    simpa [triangle231] using (baseMecPacket D).inner_at_v2
  inner_at_v2 := by
    simpa [triangle231] using (baseMecPacket D).inner_at_v3
  inner_at_v3 := by
    simpa [triangle231] using (baseMecPacket D).inner_at_v1
  disk_contains_A := (baseMecPacket D).disk_contains_A
}

private def mecPacket312 (D : CounterexampleData) :
    CircumscribedMECPacket D.A (triangle312 D) := {
  center := (baseMecPacket D).center
  radius := (baseMecPacket D).radius
  radius_pos := (baseMecPacket D).radius_pos
  moser_on_boundary_1 := by
    simpa [triangle312] using (baseMecPacket D).moser_on_boundary_3
  moser_on_boundary_2 := by
    simpa [triangle312] using (baseMecPacket D).moser_on_boundary_1
  moser_on_boundary_3 := by
    simpa [triangle312] using (baseMecPacket D).moser_on_boundary_2
  inner_at_v1 := by
    simpa [triangle312] using (baseMecPacket D).inner_at_v3
  inner_at_v2 := by
    simpa [triangle312] using (baseMecPacket D).inner_at_v1
  inner_at_v3 := by
    simpa [triangle312] using (baseMecPacket D).inner_at_v2
  disk_contains_A := (baseMecPacket D).disk_contains_A
}

private theorem endpointSwap_arc {A C : Finset ℝ²} {M : MoserTriangle A}
    (hC_arc : ∀ x ∈ A, x ∈ C ↔ OnArcOpposite M.v1 M.v2 M.v3 x) :
    ∀ x ∈ A, x ∈ C ↔ OnArcOpposite M.v1 M.v3 M.v2 x := by
  intro x hxA
  rw [hC_arc x hxA]
  unfold OnArcOpposite
  have hx :
      signedArea2 x M.v3 M.v2 = -signedArea2 x M.v2 M.v3 := by
    simp [signedArea2]
  have hM :
      signedArea2 M.v1 M.v3 M.v2 = -signedArea2 M.v1 M.v2 M.v3 := by
    simp [signedArea2]
  rw [hx, hM, neg_mul_neg]

private theorem onArcOpposite_swap_chord (vi vj vk v : ℝ²) :
    OnArcOpposite vi vj vk v ↔ OnArcOpposite vi vk vj v := by
  unfold OnArcOpposite
  have hv : signedArea2 v vk vj = -signedArea2 v vj vk := by
    simp [signedArea2]
  have hi : signedArea2 vi vk vj = -signedArea2 vi vj vk := by
    simp [signedArea2]
  rw [hv, hi, neg_mul_neg]

private def endpointSwapMecPacket {A : Finset ℝ²} {M : MoserTriangle A}
    (P : CircumscribedMECPacket A M) :
    CircumscribedMECPacket A ({
      v1 := M.v1
      v2 := M.v3
      v3 := M.v2
      v1_mem := M.v1_mem
      v2_mem := M.v3_mem
      v3_mem := M.v2_mem
      v12_ne := M.v13_ne
      v13_ne := M.v12_ne
      v23_ne := Ne.symm M.v23_ne
    } : MoserTriangle A) := {
  center := P.center
  radius := P.radius
  radius_pos := P.radius_pos
  moser_on_boundary_1 := P.moser_on_boundary_1
  moser_on_boundary_2 := P.moser_on_boundary_3
  moser_on_boundary_3 := P.moser_on_boundary_2
  inner_at_v1 := by
    simpa [real_inner_comm] using P.inner_at_v1
  inner_at_v2 := by
    simpa [real_inner_comm] using P.inner_at_v3
  inner_at_v3 := by
    simpa [real_inner_comm] using P.inner_at_v2
  disk_contains_A := P.disk_contains_A
}

private theorem exactRadius_inter_supportCap_at_v2_card_le_one
    {A C : Finset ℝ²} {M : MoserTriangle A}
    (hA : ConvexIndep A)
    (hnoncoll : ¬ Collinear ℝ (A : Set ℝ²))
    (hC_subset : C ⊆ A)
    (hC_arc : ∀ x ∈ A, x ∈ C ↔ OnArcOpposite M.v1 M.v2 M.v3 x)
    (hv_mem : M.v2 ∈ C)
    (hw_mem : M.v3 ∈ C)
    (P : CircumscribedMECPacket A M)
    (hacute : 0 ≤ inner ℝ (M.v2 - M.v1) (M.v3 - M.v1))
    (r : ℝ) :
    ((A.filter (fun x => dist x M.v2 = r)) ∩ C).card ≤ 1 := by
  have hsub : ((A.filter (fun x => dist x M.v2 = r)) ∩ C) ⊆ C := by
    intro x hx
    exact (Finset.mem_inter.mp hx).2
  have hrad :
      ∀ x ∈ (A.filter (fun x => dist x M.v2 = r)) ∩ C,
        dist M.v2 x = r := by
    intro x hx
    have hxF : x ∈ A.filter (fun x => dist x M.v2 = r) :=
      (Finset.mem_inter.mp hx).1
    have hxrad : dist x M.v2 = r := (Finset.mem_filter.mp hxF).2
    rwa [dist_comm] at hxrad
  exact FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
    hA hnoncoll hC_subset hC_arc hv_mem hw_mem P hacute hsub hrad

private theorem exactRadius_inter_supportCap_at_v3_card_le_one
    {A C : Finset ℝ²} {M : MoserTriangle A}
    (hA : ConvexIndep A)
    (hnoncoll : ¬ Collinear ℝ (A : Set ℝ²))
    (hC_subset : C ⊆ A)
    (hC_arc : ∀ x ∈ A, x ∈ C ↔ OnArcOpposite M.v1 M.v2 M.v3 x)
    (hv_mem : M.v2 ∈ C)
    (hw_mem : M.v3 ∈ C)
    (P : CircumscribedMECPacket A M)
    (hacute : 0 ≤ inner ℝ (M.v2 - M.v1) (M.v3 - M.v1))
    (r : ℝ) :
    ((A.filter (fun x => dist x M.v3 = r)) ∩ C).card ≤ 1 := by
  let M' : MoserTriangle A := {
    v1 := M.v1
    v2 := M.v3
    v3 := M.v2
    v1_mem := M.v1_mem
    v2_mem := M.v3_mem
    v3_mem := M.v2_mem
    v12_ne := M.v13_ne
    v13_ne := M.v12_ne
    v23_ne := Ne.symm M.v23_ne
  }
  have hle :=
    exactRadius_inter_supportCap_at_v2_card_le_one
      (A := A) (C := C) (M := M')
      hA hnoncoll hC_subset (endpointSwap_arc hC_arc)
      (by simpa [M'] using hw_mem)
      (by simpa [M'] using hv_mem)
      (endpointSwapMecPacket P)
      (by simpa [M', real_inner_comm] using hacute)
      r
  simpa [M'] using hle

/-- Exact-radius classes at `oppApex1` meet the surplus cap in at most one
point. -/
theorem oppApex1_surplusCap_one_hit (D : CounterexampleData) (r : ℝ) :
    ((D.A.filter (fun x => dist x D.packet.oppApex1 = r)) ∩
        D.packet.surplusCap).card ≤ 1 := by
  set CP := D.packet.partition
  let P0 := baseMecPacket D
  let P231 := mecPacket231 D
  let P312 := mecPacket312 D
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · have hle := exactRadius_inter_supportCap_at_v2_card_le_one
      D.convex D.packet.hncol CP.C1_subset
      (fun x hxA => (CP.arc_membership x hxA).1)
      CP.v2_mem_C1 CP.v3_mem_C1 P0 P0.inner_at_v1 r
    simpa [CP, P0, SurplusCapPacket.oppApex1, SurplusCapPacket.surplusCap, hi]
      using hle
  · have hle := exactRadius_inter_supportCap_at_v2_card_le_one
      (A := D.A) (C := CP.C2) (M := triangle231 D)
      D.convex D.packet.hncol CP.C2_subset
      (by
        intro x hxA
        simpa [triangle231] using (CP.arc_membership x hxA).2.1)
      (by simpa [triangle231] using CP.v3_mem_C2)
      (by simpa [triangle231] using CP.v1_mem_C2)
      P231 P231.inner_at_v1 r
    simpa [CP, P231, SurplusCapPacket.oppApex1, SurplusCapPacket.surplusCap,
      triangle231, hi] using hle
  · have hle := exactRadius_inter_supportCap_at_v2_card_le_one
      (A := D.A) (C := CP.C3) (M := triangle312 D)
      D.convex D.packet.hncol CP.C3_subset
      (by
        intro x hxA
        simpa [triangle312] using (CP.arc_membership x hxA).2.2)
      (by simpa [triangle312] using CP.v1_mem_C3)
      (by simpa [triangle312] using CP.v2_mem_C3)
      P312 P312.inner_at_v1 r
    simpa [CP, P312, SurplusCapPacket.oppApex1, SurplusCapPacket.surplusCap,
      triangle312, hi] using hle

/-- Membership in a surplus cap is exactly the corresponding oriented-arc
condition, in a form parameterized by an arbitrary packet over the carrier. -/
theorem mem_surplusCap_iff_onArc (D : CounterexampleData)
    (S : SurplusCapPacket D.A) {x : ℝ²} (hxA : x ∈ D.A) :
    x ∈ S.surplusCap ↔
      OnArcOpposite S.surplusApex S.oppApex1 S.oppApex2 x := by
  set CP := S.partition with hCP
  rcases hi : S.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, CP, hi]
      using (CP.arc_membership x hxA).1
  · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, CP, hi]
      using (CP.arc_membership x hxA).2.1
  · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, CP, hi]
      using (CP.arc_membership x hxA).2.2

/-- Two distinct carrier points outside the surplus cap cannot share both
opposite-apex radii.  This predecessor-level form is independent of the U1
large-cap tail and is the acyclic escape kernel used by ATAIL extraction. -/
theorem oppCap2_escape_gen (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {r ρ : ℝ} {x w' : ℝ²}
    (hxA : x ∈ D.A) (hw'A : w' ∈ D.A)
    (hx_notsurp : x ∉ S.surplusCap)
    (hw'_notsurp : w' ∉ S.surplusCap)
    (hne : x ≠ w')
    (hxv : dist x S.oppApex1 = r) (hw'v : dist w' S.oppApex1 = r)
    (hxw : dist x S.oppApex2 = ρ) (hw'w : dist w' S.oppApex2 = ρ) :
    False := by
  have hmid :
      signedArea2 (midpoint ℝ w' x) S.oppApex1 S.oppApex2 = 0 :=
    twoCircle_midpoint_collinear hxv hw'v hxw hw'w hne
  have hflip :
      signedArea2 x S.oppApex1 S.oppApex2 =
        - signedArea2 w' S.oppApex1 S.oppApex2 :=
    signedArea2_reflection_neg hmid
  have hxpos :
      0 < signedArea2 x S.oppApex1 S.oppApex2 *
        signedArea2 S.surplusApex S.oppApex1 S.oppApex2 := by
    rw [mem_surplusCap_iff_onArc D S hxA] at hx_notsurp
    unfold OnArcOpposite at hx_notsurp
    exact not_le.mp hx_notsurp
  have hw'pos :
      0 < signedArea2 w' S.oppApex1 S.oppApex2 *
        signedArea2 S.surplusApex S.oppApex1 S.oppApex2 := by
    rw [mem_surplusCap_iff_onArc D S hw'A] at hw'_notsurp
    unfold OnArcOpposite at hw'_notsurp
    exact not_le.mp hw'_notsurp
  have hkey :
      signedArea2 x S.oppApex1 S.oppApex2 *
          signedArea2 S.surplusApex S.oppApex1 S.oppApex2
        = -(signedArea2 w' S.oppApex1 S.oppApex2 *
          signedArea2 S.surplusApex S.oppApex1 S.oppApex2) := by
    rw [hflip]
    ring
  linarith [hxpos, hw'pos, hkey]

/-- Exact-radius classes at `oppApex1` meet the other non-surplus cap in at
most one point. -/
theorem oppApex1_otherCap_one_hit (D : CounterexampleData) (r : ℝ) :
    ((D.A.filter (fun x => dist x D.packet.oppApex1 = r)) ∩
        D.packet.oppCap2).card ≤ 1 := by
  set CP := D.packet.partition
  let P0 := baseMecPacket D
  let P231 := mecPacket231 D
  let P312 := mecPacket312 D
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · have hle := exactRadius_inter_supportCap_at_v3_card_le_one
      (A := D.A) (C := CP.C3) (M := triangle312 D)
      D.convex D.packet.hncol CP.C3_subset
      (by
        intro x hxA
        simpa [triangle312] using (CP.arc_membership x hxA).2.2)
      (by simpa [triangle312] using CP.v1_mem_C3)
      (by simpa [triangle312] using CP.v2_mem_C3)
      P312 P312.inner_at_v1 r
    simpa [CP, P312, SurplusCapPacket.oppApex1, SurplusCapPacket.oppCap2,
      triangle312, hi] using hle
  · have hle := exactRadius_inter_supportCap_at_v3_card_le_one
      D.convex D.packet.hncol CP.C1_subset
      (fun x hxA => (CP.arc_membership x hxA).1)
      CP.v2_mem_C1 CP.v3_mem_C1 P0 P0.inner_at_v1 r
    simpa [CP, P0, SurplusCapPacket.oppApex1, SurplusCapPacket.oppCap2, hi]
      using hle
  · have hle := exactRadius_inter_supportCap_at_v3_card_le_one
      (A := D.A) (C := CP.C2) (M := triangle231 D)
      D.convex D.packet.hncol CP.C2_subset
      (by
        intro x hxA
        simpa [triangle231] using (CP.arc_membership x hxA).2.1)
      (by simpa [triangle231] using CP.v3_mem_C2)
      (by simpa [triangle231] using CP.v1_mem_C2)
      P231 P231.inner_at_v1 r
    simpa [CP, P231, SurplusCapPacket.oppApex1, SurplusCapPacket.oppCap2,
      triangle231, hi] using hle

/-- Exact-radius classes at `oppApex2` meet the surplus cap in at most one
point. -/
theorem oppApex2_surplusCap_one_hit (D : CounterexampleData) (r : ℝ) :
    ((D.A.filter (fun x => dist x D.packet.oppApex2 = r)) ∩
        D.packet.surplusCap).card ≤ 1 := by
  set CP := D.packet.partition
  let P0 := baseMecPacket D
  let P231 := mecPacket231 D
  let P312 := mecPacket312 D
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · have hle := exactRadius_inter_supportCap_at_v3_card_le_one
      D.convex D.packet.hncol CP.C1_subset
      (fun x hxA => (CP.arc_membership x hxA).1)
      CP.v2_mem_C1 CP.v3_mem_C1 P0 P0.inner_at_v1 r
    simpa [CP, P0, SurplusCapPacket.oppApex2, SurplusCapPacket.surplusCap, hi]
      using hle
  · have hle := exactRadius_inter_supportCap_at_v3_card_le_one
      (A := D.A) (C := CP.C2) (M := triangle231 D)
      D.convex D.packet.hncol CP.C2_subset
      (by
        intro x hxA
        simpa [triangle231] using (CP.arc_membership x hxA).2.1)
      (by simpa [triangle231] using CP.v3_mem_C2)
      (by simpa [triangle231] using CP.v1_mem_C2)
      P231 P231.inner_at_v1 r
    simpa [CP, P231, SurplusCapPacket.oppApex2, SurplusCapPacket.surplusCap,
      triangle231, hi] using hle
  · have hle := exactRadius_inter_supportCap_at_v3_card_le_one
      (A := D.A) (C := CP.C3) (M := triangle312 D)
      D.convex D.packet.hncol CP.C3_subset
      (by
        intro x hxA
        simpa [triangle312] using (CP.arc_membership x hxA).2.2)
      (by simpa [triangle312] using CP.v1_mem_C3)
      (by simpa [triangle312] using CP.v2_mem_C3)
      P312 P312.inner_at_v1 r
    simpa [CP, P312, SurplusCapPacket.oppApex2, SurplusCapPacket.surplusCap,
      triangle312, hi] using hle

/-- Exact-radius classes at `oppApex2` meet the other non-surplus cap in at
most one point. -/
theorem oppApex2_otherCap_one_hit (D : CounterexampleData) (r : ℝ) :
    ((D.A.filter (fun x => dist x D.packet.oppApex2 = r)) ∩
        D.packet.oppCap1).card ≤ 1 := by
  set CP := D.packet.partition
  let P0 := baseMecPacket D
  let P231 := mecPacket231 D
  let P312 := mecPacket312 D
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · have hle := exactRadius_inter_supportCap_at_v2_card_le_one
      (A := D.A) (C := CP.C2) (M := triangle231 D)
      D.convex D.packet.hncol CP.C2_subset
      (by
        intro x hxA
        simpa [triangle231] using (CP.arc_membership x hxA).2.1)
      (by simpa [triangle231] using CP.v3_mem_C2)
      (by simpa [triangle231] using CP.v1_mem_C2)
      P231 P231.inner_at_v1 r
    simpa [CP, P231, SurplusCapPacket.oppApex2, SurplusCapPacket.oppCap1,
      triangle231, hi] using hle
  · have hle := exactRadius_inter_supportCap_at_v2_card_le_one
      (A := D.A) (C := CP.C3) (M := triangle312 D)
      D.convex D.packet.hncol CP.C3_subset
      (by
        intro x hxA
        simpa [triangle312] using (CP.arc_membership x hxA).2.2)
      (by simpa [triangle312] using CP.v1_mem_C3)
      (by simpa [triangle312] using CP.v2_mem_C3)
      P312 P312.inner_at_v1 r
    simpa [CP, P312, SurplusCapPacket.oppApex2, SurplusCapPacket.oppCap1,
      triangle312, hi] using hle
  · have hle := exactRadius_inter_supportCap_at_v2_card_le_one
      D.convex D.packet.hncol CP.C1_subset
      (fun x hxA => (CP.arc_membership x hxA).1)
      CP.v2_mem_C1 CP.v3_mem_C1 P0 P0.inner_at_v1 r
    simpa [CP, P0, SurplusCapPacket.oppApex2, SurplusCapPacket.oppCap1, hi]
      using hle

/-- Full non-surplus squeeze at the first opposite apex: the adjacent one-hit
inputs are discharged by endpoint support-cap monotonicity. -/
theorem oppApex1_squeeze_of_isM44 (D : CounterexampleData) (r : ℝ)
    (hM44 : D.IsM44)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card) :
    (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card = 4 ∧
      D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2) ⊆
        D.A.filter (fun x => dist x D.packet.oppApex1 = r) ∧
      ((D.A.filter (fun x => dist x D.packet.oppApex1 = r)) ∩
          D.packet.surplusCap).card = 1 ∧
      ((D.A.filter (fun x => dist x D.packet.oppApex1 = r)) ∩
          D.packet.oppCap2).card = 1 :=
  oppApex1_of_isM44_adjacent_one_hits D r hM44
    (oppApex1_surplusCap_one_hit D r)
    (oppApex1_otherCap_one_hit D r)
    hK4

/-- Full non-surplus squeeze at the second opposite apex: the adjacent one-hit
inputs are discharged by endpoint support-cap monotonicity. -/
theorem oppApex2_squeeze_of_isM44 (D : CounterexampleData) (r : ℝ)
    (hM44 : D.IsM44)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card) :
    (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card = 4 ∧
      D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1) ⊆
        D.A.filter (fun x => dist x D.packet.oppApex2 = r) ∧
      ((D.A.filter (fun x => dist x D.packet.oppApex2 = r)) ∩
          D.packet.surplusCap).card = 1 ∧
      ((D.A.filter (fun x => dist x D.packet.oppApex2 = r)) ∩
          D.packet.oppCap1).card = 1 :=
  oppApex2_of_isM44_adjacent_one_hits D r hM44
    (oppApex2_surplusCap_one_hit D r)
    (oppApex2_otherCap_one_hit D r)
    hK4

private lemma eq_of_mem_of_mem_card_eq_one {α : Type _}
    {S : Finset α} {a b : α} (ha : a ∈ S) (hb : b ∈ S)
    (hcard : S.card = 1) : a = b := by
  classical
  rcases Finset.card_eq_one.mp hcard with ⟨c, hc⟩
  have ha' : a = c := by simpa [hc] using ha
  have hb' : b = c := by simpa [hc] using hb
  exact ha'.trans hb'.symm

/-- The first-apex squeeze gives cap-containment once the two adjacent
singleton hits are known to be shared points of `oppCap1`. -/
theorem oppApex1_containment_of_adjacent_hits (D : CounterexampleData) (r : ℝ)
    (hM44 : D.IsM44)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card)
    (hSurpHit :
      ∃ s, s ∈ D.A.filter (fun x => dist x D.packet.oppApex1 = r) ∧
        s ∈ D.packet.oppCap1 ∧ s ∈ D.packet.surplusCap)
    (hOtherHit :
      ∃ t, t ∈ D.A.filter (fun x => dist x D.packet.oppApex1 = r) ∧
        t ∈ D.packet.oppCap1 ∧ t ∈ D.packet.oppCap2) :
    D.A.filter (fun x => dist x D.packet.oppApex1 = r) ⊆
      D.packet.oppCap1 := by
  let T := D.A.filter (fun x => dist x D.packet.oppApex1 = r)
  have hsqueeze := oppApex1_squeeze_of_isM44 D r hM44 hK4
  have hSurpCard : (T ∩ D.packet.surplusCap).card = 1 := by
    simpa [T] using hsqueeze.2.2.1
  have hOtherCard : (T ∩ D.packet.oppCap2).card = 1 := by
    simpa [T] using hsqueeze.2.2.2
  obtain ⟨s, hsT, hsOpp, hsSurp⟩ := hSurpHit
  obtain ⟨t, htT, htOpp, htOther⟩ := hOtherHit
  have hsInter : s ∈ T ∩ D.packet.surplusCap := by
    exact Finset.mem_inter.mpr ⟨by simpa [T] using hsT, hsSurp⟩
  have htInter : t ∈ T ∩ D.packet.oppCap2 := by
    exact Finset.mem_inter.mpr ⟨by simpa [T] using htT, htOther⟩
  intro x hxT
  have hxCover := oppApex1_exactRadiusClass_cover D r hxT
  simp only [Finset.mem_union, Finset.mem_sdiff] at hxCover
  rcases hxCover with (hxSurp | hxOther) | hxInterior
  · have hxInter : x ∈ T ∩ D.packet.surplusCap :=
      Finset.mem_inter.mpr ⟨by simpa [T] using hxT, hxSurp⟩
    have hxs : x = s :=
      eq_of_mem_of_mem_card_eq_one hxInter hsInter hSurpCard
    simpa [hxs] using hsOpp
  · have hxInter : x ∈ T ∩ D.packet.oppCap2 :=
      Finset.mem_inter.mpr ⟨by simpa [T] using hxT, hxOther⟩
    have hxt : x = t :=
      eq_of_mem_of_mem_card_eq_one hxInter htInter hOtherCard
    simpa [hxt] using htOpp
  · exact hxInterior.1

/-- The second-apex squeeze gives cap-containment once the two adjacent
singleton hits are known to be shared points of `oppCap2`. -/
theorem oppApex2_containment_of_adjacent_hits (D : CounterexampleData) (r : ℝ)
    (hM44 : D.IsM44)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card)
    (hSurpHit :
      ∃ s, s ∈ D.A.filter (fun x => dist x D.packet.oppApex2 = r) ∧
        s ∈ D.packet.oppCap2 ∧ s ∈ D.packet.surplusCap)
    (hOtherHit :
      ∃ t, t ∈ D.A.filter (fun x => dist x D.packet.oppApex2 = r) ∧
        t ∈ D.packet.oppCap2 ∧ t ∈ D.packet.oppCap1) :
    D.A.filter (fun x => dist x D.packet.oppApex2 = r) ⊆
      D.packet.oppCap2 := by
  let T := D.A.filter (fun x => dist x D.packet.oppApex2 = r)
  have hsqueeze := oppApex2_squeeze_of_isM44 D r hM44 hK4
  have hSurpCard : (T ∩ D.packet.surplusCap).card = 1 := by
    simpa [T] using hsqueeze.2.2.1
  have hOtherCard : (T ∩ D.packet.oppCap1).card = 1 := by
    simpa [T] using hsqueeze.2.2.2
  obtain ⟨s, hsT, hsOpp, hsSurp⟩ := hSurpHit
  obtain ⟨t, htT, htOpp, htOther⟩ := hOtherHit
  have hsInter : s ∈ T ∩ D.packet.surplusCap := by
    exact Finset.mem_inter.mpr ⟨by simpa [T] using hsT, hsSurp⟩
  have htInter : t ∈ T ∩ D.packet.oppCap1 := by
    exact Finset.mem_inter.mpr ⟨by simpa [T] using htT, htOther⟩
  intro x hxT
  have hxCover := oppApex2_exactRadiusClass_cover D r hxT
  simp only [Finset.mem_union, Finset.mem_sdiff] at hxCover
  rcases hxCover with (hxSurp | hxOther) | hxInterior
  · have hxInter : x ∈ T ∩ D.packet.surplusCap :=
      Finset.mem_inter.mpr ⟨by simpa [T] using hxT, hxSurp⟩
    have hxs : x = s :=
      eq_of_mem_of_mem_card_eq_one hxInter hsInter hSurpCard
    simpa [hxs] using hsOpp
  · have hxInter : x ∈ T ∩ D.packet.oppCap1 :=
      Finset.mem_inter.mpr ⟨by simpa [T] using hxT, hxOther⟩
    have hxt : x = t :=
      eq_of_mem_of_mem_card_eq_one hxInter htInter hOtherCard
    simpa [hxt] using htOpp
  · exact hxInterior.1

private def surplusApexLocal (D : CounterexampleData) : ℝ² :=
  match D.packet.surplusIdx with
  | ⟨0, _⟩ => D.packet.triangle.v1
  | ⟨1, _⟩ => D.packet.triangle.v2
  | _ => D.packet.triangle.v3

private lemma mem_moserVerts_cases {A : Finset ℝ²} {M : MoserTriangle A}
    {x : ℝ²} (hx : x ∈ M.verts) :
    x = M.v1 ∨ x = M.v2 ∨ x = M.v3 := by
  simpa [MoserTriangle.verts] using hx

private theorem center_not_mem_large_exactRadiusClass
    (A : Finset ℝ²) (p : ℝ²) (r : ℝ)
    (hK4 : 4 ≤ (A.filter (fun x => dist x p = r)).card) :
    p ∉ A.filter (fun x => dist x p = r) := by
  intro hp
  have hr : r = 0 := by
    have hpdist : dist p p = r := (Finset.mem_filter.mp hp).2
    simpa using hpdist.symm
  have hsub : A.filter (fun x => dist x p = r) ⊆ ({p} : Finset ℝ²) := by
    intro x hx
    have hdist : dist x p = 0 := by
      simpa [hr] using (Finset.mem_filter.mp hx).2
    have hxp : x = p := dist_eq_zero.mp hdist
    simp [hxp]
  have hle : (A.filter (fun x => dist x p = r)).card ≤ 1 := by
    exact (Finset.card_le_card hsub).trans (by simp)
  omega

private theorem oppCap1_subset_A (D : CounterexampleData) :
    D.packet.oppCap1 ⊆ D.A := by
  set CP := D.packet.partition
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [CP, SurplusCapPacket.oppCap1, hi] using CP.C2_subset
  · simpa [CP, SurplusCapPacket.oppCap1, hi] using CP.C3_subset
  · simpa [CP, SurplusCapPacket.oppCap1, hi] using CP.C1_subset

private theorem oppCap2_subset_A (D : CounterexampleData) :
    D.packet.oppCap2 ⊆ D.A := by
  set CP := D.packet.partition
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [CP, SurplusCapPacket.oppCap2, hi] using CP.C3_subset
  · simpa [CP, SurplusCapPacket.oppCap2, hi] using CP.C1_subset
  · simpa [CP, SurplusCapPacket.oppCap2, hi] using CP.C2_subset

private theorem oppApex2_mem_oppCap1 (D : CounterexampleData) :
    D.packet.oppApex2 ∈ D.packet.oppCap1 := by
  set CP := D.packet.partition
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppApex2, hi] using
      CP.v3_mem_C2
  · simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppApex2, hi] using
      CP.v1_mem_C3
  · simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppApex2, hi] using
      CP.v2_mem_C1

private theorem oppApex2_mem_surplusCap (D : CounterexampleData) :
    D.packet.oppApex2 ∈ D.packet.surplusCap := by
  set CP := D.packet.partition
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [CP, SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex2, hi] using
      CP.v3_mem_C1
  · simpa [CP, SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex2, hi] using
      CP.v1_mem_C2
  · simpa [CP, SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex2, hi] using
      CP.v2_mem_C3

private theorem oppApex1_mem_oppCap2 (D : CounterexampleData) :
    D.packet.oppApex1 ∈ D.packet.oppCap2 := by
  set CP := D.packet.partition
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [CP, SurplusCapPacket.oppCap2, SurplusCapPacket.oppApex1, hi] using
      CP.v2_mem_C3
  · simpa [CP, SurplusCapPacket.oppCap2, SurplusCapPacket.oppApex1, hi] using
      CP.v3_mem_C1
  · simpa [CP, SurplusCapPacket.oppCap2, SurplusCapPacket.oppApex1, hi] using
      CP.v1_mem_C2

private theorem oppApex1_mem_surplusCap (D : CounterexampleData) :
    D.packet.oppApex1 ∈ D.packet.surplusCap := by
  set CP := D.packet.partition
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [CP, SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi] using
      CP.v2_mem_C1
  · simpa [CP, SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi] using
      CP.v3_mem_C2
  · simpa [CP, SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi] using
      CP.v1_mem_C3

/-- If the two boundary endpoints of `oppCap1` lie in the queried
exact-radius class around `oppApex1`, then the whole exact-radius class is
contained in `oppCap1`. -/
theorem oppApex1_filter_subset_oppCap1_of_endpointRadius
    (D : CounterexampleData) {r : ℝ} (hr : 0 < r)
    (hOther : dist D.packet.oppApex2 D.packet.oppApex1 = r)
    (hSurp : dist D.packet.surplusApex D.packet.oppApex1 = r) :
    D.A.filter (fun x => dist x D.packet.oppApex1 = r) ⊆
      D.packet.oppCap1 := by
  intro x hxT
  set CP := D.packet.partition
  let P := baseMecPacket D
  have hxA : x ∈ D.A := (Finset.mem_filter.mp hxT).1
  have hxDist : dist x D.packet.oppApex1 = r :=
    (Finset.mem_filter.mp hxT).2
  have hxDisk : dist x P.center ≤ P.radius := by
    simpa [P, dist_eq_norm] using P.disk_contains_A x hxA
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · have hArc :
        OnArcOpposite D.packet.triangle.v2 D.packet.triangle.v3
          D.packet.triangle.v1 x := by
      exact onArcOpposite_of_sameDist_apex_of_mem_mecDisk
        (O := P.center) (apex := D.packet.triangle.v2)
        (e₁ := D.packet.triangle.v3) (e₂ := D.packet.triangle.v1)
        (p := x) (R := P.radius) (d := r)
        P.radius_pos hr
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_2)
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_3)
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_1)
        (by
          simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi]
            using hOther)
        (by
          simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.surplusApex, hi]
            using hSurp)
        (by
          simpa [SurplusCapPacket.oppApex1, hi] using hxDist)
        hxDisk
    have hxC2 : x ∈ CP.C2 := ((CP.arc_membership x hxA).2.1).mpr hArc
    simpa [CP, SurplusCapPacket.oppCap1, hi] using hxC2
  · have hArc :
        OnArcOpposite D.packet.triangle.v3 D.packet.triangle.v1
          D.packet.triangle.v2 x := by
      exact onArcOpposite_of_sameDist_apex_of_mem_mecDisk
        (O := P.center) (apex := D.packet.triangle.v3)
        (e₁ := D.packet.triangle.v1) (e₂ := D.packet.triangle.v2)
        (p := x) (R := P.radius) (d := r)
        P.radius_pos hr
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_3)
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_1)
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_2)
        (by
          simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi]
            using hOther)
        (by
          simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.surplusApex, hi]
            using hSurp)
        (by
          simpa [SurplusCapPacket.oppApex1, hi] using hxDist)
        hxDisk
    have hxC3 : x ∈ CP.C3 := ((CP.arc_membership x hxA).2.2).mpr hArc
    simpa [CP, SurplusCapPacket.oppCap1, hi] using hxC3
  · have hArc :
        OnArcOpposite D.packet.triangle.v1 D.packet.triangle.v2
          D.packet.triangle.v3 x := by
      exact onArcOpposite_of_sameDist_apex_of_mem_mecDisk
        (O := P.center) (apex := D.packet.triangle.v1)
        (e₁ := D.packet.triangle.v2) (e₂ := D.packet.triangle.v3)
        (p := x) (R := P.radius) (d := r)
        P.radius_pos hr
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_1)
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_2)
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_3)
        (by
          simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi]
            using hOther)
        (by
          simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.surplusApex, hi]
            using hSurp)
        (by
          simpa [SurplusCapPacket.oppApex1, hi] using hxDist)
        hxDisk
    have hxC1 : x ∈ CP.C1 := ((CP.arc_membership x hxA).1).mpr hArc
    simpa [CP, SurplusCapPacket.oppCap1, hi] using hxC1

/-- If the two boundary endpoints of `oppCap2` lie in the queried
exact-radius class around `oppApex2`, then the whole exact-radius class is
contained in `oppCap2`. -/
theorem oppApex2_filter_subset_oppCap2_of_endpointRadius
    (D : CounterexampleData) {r : ℝ} (hr : 0 < r)
    (hOther : dist D.packet.oppApex1 D.packet.oppApex2 = r)
    (hSurp : dist D.packet.surplusApex D.packet.oppApex2 = r) :
    D.A.filter (fun x => dist x D.packet.oppApex2 = r) ⊆
      D.packet.oppCap2 := by
  intro x hxT
  set CP := D.packet.partition
  let P := baseMecPacket D
  have hxA : x ∈ D.A := (Finset.mem_filter.mp hxT).1
  have hxDist : dist x D.packet.oppApex2 = r :=
    (Finset.mem_filter.mp hxT).2
  have hxDisk : dist x P.center ≤ P.radius := by
    simpa [P, dist_eq_norm] using P.disk_contains_A x hxA
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · have hArc :
        OnArcOpposite D.packet.triangle.v3 D.packet.triangle.v1
          D.packet.triangle.v2 x := by
      exact onArcOpposite_of_sameDist_apex_of_mem_mecDisk
        (O := P.center) (apex := D.packet.triangle.v3)
        (e₁ := D.packet.triangle.v1) (e₂ := D.packet.triangle.v2)
        (p := x) (R := P.radius) (d := r)
        P.radius_pos hr
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_3)
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_1)
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_2)
        (by
          simpa [SurplusCapPacket.oppApex2, SurplusCapPacket.surplusApex, hi]
            using hSurp)
        (by
          simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi]
            using hOther)
        (by
          simpa [SurplusCapPacket.oppApex2, hi] using hxDist)
        hxDisk
    have hxC3 : x ∈ CP.C3 := ((CP.arc_membership x hxA).2.2).mpr hArc
    simpa [CP, SurplusCapPacket.oppCap2, hi] using hxC3
  · have hArc :
        OnArcOpposite D.packet.triangle.v1 D.packet.triangle.v2
          D.packet.triangle.v3 x := by
      exact onArcOpposite_of_sameDist_apex_of_mem_mecDisk
        (O := P.center) (apex := D.packet.triangle.v1)
        (e₁ := D.packet.triangle.v2) (e₂ := D.packet.triangle.v3)
        (p := x) (R := P.radius) (d := r)
        P.radius_pos hr
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_1)
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_2)
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_3)
        (by
          simpa [SurplusCapPacket.oppApex2, SurplusCapPacket.surplusApex, hi]
            using hSurp)
        (by
          simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi]
            using hOther)
        (by
          simpa [SurplusCapPacket.oppApex2, hi] using hxDist)
        hxDisk
    have hxC1 : x ∈ CP.C1 := ((CP.arc_membership x hxA).1).mpr hArc
    simpa [CP, SurplusCapPacket.oppCap2, hi] using hxC1
  · have hArc :
        OnArcOpposite D.packet.triangle.v2 D.packet.triangle.v3
          D.packet.triangle.v1 x := by
      exact onArcOpposite_of_sameDist_apex_of_mem_mecDisk
        (O := P.center) (apex := D.packet.triangle.v2)
        (e₁ := D.packet.triangle.v3) (e₂ := D.packet.triangle.v1)
        (p := x) (R := P.radius) (d := r)
        P.radius_pos hr
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_2)
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_3)
        (by simpa [P, dist_eq_norm] using P.moser_on_boundary_1)
        (by
          simpa [SurplusCapPacket.oppApex2, SurplusCapPacket.surplusApex, hi]
            using hSurp)
        (by
          simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi]
            using hOther)
        (by
          simpa [SurplusCapPacket.oppApex2, hi] using hxDist)
        hxDisk
    have hxC2 : x ∈ CP.C2 := ((CP.arc_membership x hxA).2.1).mpr hArc
    simpa [CP, SurplusCapPacket.oppCap2, hi] using hxC2

private theorem surplus_inter_oppCap2_subset_oppApex1 (D : CounterexampleData) :
    D.packet.surplusCap ∩ D.packet.oppCap2 ⊆
      ({D.packet.oppApex1} : Finset ℝ²) := by
  intro x hx
  have hxSurp : x ∈ D.packet.surplusCap := (Finset.mem_inter.mp hx).1
  have hxOpp2 : x ∈ D.packet.oppCap2 := (Finset.mem_inter.mp hx).2
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] at hxSurp hxOpp2 ⊢
    by_cases hxVerts : x ∈ D.packet.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (D.packet.partition.v1_notin_C1 hxSurp)
      · simp
      · exact False.elim (D.packet.partition.v3_notin_C3 hxOpp2)
    · have hxA : x ∈ D.A := D.packet.partition.C1_subset hxSurp
      have hone := D.packet.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC2 : x ∈ D.packet.partition.C2
      · simp [hxSurp, hxC2, hxOpp2] at hone
      · simp [hxSurp, hxC2, hxOpp2] at hone
  · simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] at hxSurp hxOpp2 ⊢
    by_cases hxVerts : x ∈ D.packet.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (D.packet.partition.v1_notin_C1 hxOpp2)
      · exact False.elim (D.packet.partition.v2_notin_C2 hxSurp)
      · simp
    · have hxA : x ∈ D.A := D.packet.partition.C2_subset hxSurp
      have hone := D.packet.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC3 : x ∈ D.packet.partition.C3
      · simp [hxOpp2, hxSurp, hxC3] at hone
      · simp [hxOpp2, hxSurp, hxC3] at hone
  · simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] at hxSurp hxOpp2 ⊢
    by_cases hxVerts : x ∈ D.packet.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · simp
      · exact False.elim (D.packet.partition.v2_notin_C2 hxOpp2)
      · exact False.elim (D.packet.partition.v3_notin_C3 hxSurp)
    · have hxA : x ∈ D.A := D.packet.partition.C3_subset hxSurp
      have hone := D.packet.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC1 : x ∈ D.packet.partition.C1
      · simp [hxC1, hxOpp2, hxSurp] at hone
      · simp [hxC1, hxOpp2, hxSurp] at hone

/-- The surplus cap meets `oppCap1` only at their shared Moser endpoint
`oppApex2` (partition combinatorics). -/
theorem surplus_inter_oppCap1_subset_oppApex2 (D : CounterexampleData) :
    D.packet.surplusCap ∩ D.packet.oppCap1 ⊆
      ({D.packet.oppApex2} : Finset ℝ²) := by
  intro x hx
  have hxSurp : x ∈ D.packet.surplusCap := (Finset.mem_inter.mp hx).1
  have hxOpp1 : x ∈ D.packet.oppCap1 := (Finset.mem_inter.mp hx).2
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppApex2, hi] at hxSurp hxOpp1 ⊢
    by_cases hxVerts : x ∈ D.packet.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (D.packet.partition.v1_notin_C1 hxSurp)
      · exact False.elim (D.packet.partition.v2_notin_C2 hxOpp1)
      · simp
    · have hxA : x ∈ D.A := D.packet.partition.C1_subset hxSurp
      have hone := D.packet.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC3 : x ∈ D.packet.partition.C3
      · simp [hxSurp, hxOpp1, hxC3] at hone
      · simp [hxSurp, hxOpp1, hxC3] at hone
  · simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppApex2, hi] at hxSurp hxOpp1 ⊢
    by_cases hxVerts : x ∈ D.packet.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · simp
      · exact False.elim (D.packet.partition.v2_notin_C2 hxSurp)
      · exact False.elim (D.packet.partition.v3_notin_C3 hxOpp1)
    · have hxA : x ∈ D.A := D.packet.partition.C2_subset hxSurp
      have hone := D.packet.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC1 : x ∈ D.packet.partition.C1
      · simp [hxC1, hxSurp, hxOpp1] at hone
      · simp [hxC1, hxSurp, hxOpp1] at hone
  · simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppApex2, hi] at hxSurp hxOpp1 ⊢
    by_cases hxVerts : x ∈ D.packet.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (D.packet.partition.v1_notin_C1 hxOpp1)
      · simp
      · exact False.elim (D.packet.partition.v3_notin_C3 hxSurp)
    · have hxA : x ∈ D.A := D.packet.partition.C3_subset hxSurp
      have hone := D.packet.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC2 : x ∈ D.packet.partition.C2
      · simp [hxOpp1, hxC2, hxSurp] at hone
      · simp [hxOpp1, hxC2, hxSurp] at hone

/-- If a first-apex exact-radius hit in the surplus cap is not in `oppCap1`,
then it is a strict surplus-cap point, not a shared endpoint. -/
theorem oppApex1_surplus_hit_strict_of_not_oppCap1
    (D : CounterexampleData) (r : ℝ) {x : ℝ²}
    (hK4 : 4 ≤ (D.A.filter (fun y => dist y D.packet.oppApex1 = r)).card)
    (hxT : x ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r))
    (hxSurp : x ∈ D.packet.surplusCap)
    (hxNotOpp1 : x ∉ D.packet.oppCap1) :
    x ∈ D.packet.surplusCap \
      (D.packet.oppCap1 ∪ D.packet.oppCap2) := by
  have hcenterNot :=
    center_not_mem_large_exactRadiusClass D.A D.packet.oppApex1 r hK4
  have hxNotOpp2 : x ∉ D.packet.oppCap2 := by
    intro hxOpp2
    have hxInter : x ∈ D.packet.surplusCap ∩ D.packet.oppCap2 :=
      Finset.mem_inter.mpr ⟨hxSurp, hxOpp2⟩
    have hxSing : x ∈ ({D.packet.oppApex1} : Finset ℝ²) :=
      surplus_inter_oppCap2_subset_oppApex1 D hxInter
    have hxEq : x = D.packet.oppApex1 := by
      simpa using hxSing
    exact hcenterNot (by simpa [hxEq] using hxT)
  exact Finset.mem_sdiff.mpr
    ⟨hxSurp, fun hxUnion => by
      rcases Finset.mem_union.mp hxUnion with hxOpp1 | hxOpp2
      · exact hxNotOpp1 hxOpp1
      · exact hxNotOpp2 hxOpp2⟩

/-- If a first-apex exact-radius hit in the other non-surplus cap is not in
`oppCap1`, then it is a strict `oppCap2` point, not a shared endpoint. -/
theorem oppApex1_other_hit_strict_of_not_oppCap1
    (D : CounterexampleData) (r : ℝ) {x : ℝ²}
    (hK4 : 4 ≤ (D.A.filter (fun y => dist y D.packet.oppApex1 = r)).card)
    (hxT : x ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r))
    (hxOther : x ∈ D.packet.oppCap2)
    (hxNotOpp1 : x ∉ D.packet.oppCap1) :
    x ∈ D.packet.oppCap2 \
      (D.packet.surplusCap ∪ D.packet.oppCap1) := by
  have hcenterNot :=
    center_not_mem_large_exactRadiusClass D.A D.packet.oppApex1 r hK4
  have hxNotSurp : x ∉ D.packet.surplusCap := by
    intro hxSurp
    have hxInter : x ∈ D.packet.surplusCap ∩ D.packet.oppCap2 :=
      Finset.mem_inter.mpr ⟨hxSurp, hxOther⟩
    have hxSing : x ∈ ({D.packet.oppApex1} : Finset ℝ²) :=
      surplus_inter_oppCap2_subset_oppApex1 D hxInter
    have hxEq : x = D.packet.oppApex1 := by
      simpa using hxSing
    exact hcenterNot (by simpa [hxEq] using hxT)
  exact Finset.mem_sdiff.mpr
    ⟨hxOther, fun hxUnion => by
      rcases Finset.mem_union.mp hxUnion with hxSurp | hxOpp1
      · exact hxNotSurp hxSurp
      · exact hxNotOpp1 hxOpp1⟩

/-- If a second-apex exact-radius hit in the surplus cap is not in `oppCap2`,
then it is a strict surplus-cap point, not a shared endpoint. -/
theorem oppApex2_surplus_hit_strict_of_not_oppCap2
    (D : CounterexampleData) (r : ℝ) {x : ℝ²}
    (hK4 : 4 ≤ (D.A.filter (fun y => dist y D.packet.oppApex2 = r)).card)
    (hxT : x ∈ D.A.filter (fun y => dist y D.packet.oppApex2 = r))
    (hxSurp : x ∈ D.packet.surplusCap)
    (hxNotOpp2 : x ∉ D.packet.oppCap2) :
    x ∈ D.packet.surplusCap \
      (D.packet.oppCap2 ∪ D.packet.oppCap1) := by
  have hcenterNot :=
    center_not_mem_large_exactRadiusClass D.A D.packet.oppApex2 r hK4
  have hxNotOpp1 : x ∉ D.packet.oppCap1 := by
    intro hxOpp1
    have hxInter : x ∈ D.packet.surplusCap ∩ D.packet.oppCap1 :=
      Finset.mem_inter.mpr ⟨hxSurp, hxOpp1⟩
    have hxSing : x ∈ ({D.packet.oppApex2} : Finset ℝ²) :=
      surplus_inter_oppCap1_subset_oppApex2 D hxInter
    have hxEq : x = D.packet.oppApex2 := by
      simpa using hxSing
    exact hcenterNot (by simpa [hxEq] using hxT)
  exact Finset.mem_sdiff.mpr
    ⟨hxSurp, fun hxUnion => by
      rcases Finset.mem_union.mp hxUnion with hxOpp2 | hxOpp1
      · exact hxNotOpp2 hxOpp2
      · exact hxNotOpp1 hxOpp1⟩

/-- If a second-apex exact-radius hit in the other non-surplus cap is not in
`oppCap2`, then it is a strict `oppCap1` point, not a shared endpoint. -/
theorem oppApex2_other_hit_strict_of_not_oppCap2
    (D : CounterexampleData) (r : ℝ) {x : ℝ²}
    (hK4 : 4 ≤ (D.A.filter (fun y => dist y D.packet.oppApex2 = r)).card)
    (hxT : x ∈ D.A.filter (fun y => dist y D.packet.oppApex2 = r))
    (hxOther : x ∈ D.packet.oppCap1)
    (hxNotOpp2 : x ∉ D.packet.oppCap2) :
    x ∈ D.packet.oppCap1 \
      (D.packet.surplusCap ∪ D.packet.oppCap2) := by
  have hcenterNot :=
    center_not_mem_large_exactRadiusClass D.A D.packet.oppApex2 r hK4
  have hxNotSurp : x ∉ D.packet.surplusCap := by
    intro hxSurp
    have hxInter : x ∈ D.packet.surplusCap ∩ D.packet.oppCap1 :=
      Finset.mem_inter.mpr ⟨hxSurp, hxOther⟩
    have hxSing : x ∈ ({D.packet.oppApex2} : Finset ℝ²) :=
      surplus_inter_oppCap1_subset_oppApex2 D hxInter
    have hxEq : x = D.packet.oppApex2 := by
      simpa using hxSing
    exact hcenterNot (by simpa [hxEq] using hxT)
  exact Finset.mem_sdiff.mpr
    ⟨hxOther, fun hxUnion => by
      rcases Finset.mem_union.mp hxUnion with hxSurp | hxOpp2
      · exact hxNotSurp hxSurp
      · exact hxNotOpp2 hxOpp2⟩

/-- First-apex containment either holds, or the remaining failure is a strict
adjacent-cap escape.  This removes the shared-endpoint cases from the residual. -/
theorem oppApex1_containment_or_strict_adjacent_escape
    (D : CounterexampleData) (r : ℝ)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card) :
    D.A.filter (fun x => dist x D.packet.oppApex1 = r) ⊆
        D.packet.oppCap1 ∨
      ∃ x, x ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r) ∧
        (x ∈ D.packet.surplusCap \
            (D.packet.oppCap1 ∪ D.packet.oppCap2) ∨
          x ∈ D.packet.oppCap2 \
            (D.packet.surplusCap ∪ D.packet.oppCap1)) := by
  classical
  by_cases hcont :
      D.A.filter (fun x => dist x D.packet.oppApex1 = r) ⊆
        D.packet.oppCap1
  · exact Or.inl hcont
  · simp only [Finset.subset_iff] at hcont
    push_neg at hcont
    obtain ⟨x, hxT, hxNotOpp1⟩ := hcont
    have hxCover := oppApex1_exactRadiusClass_cover D r hxT
    simp only [Finset.mem_union, Finset.mem_sdiff] at hxCover
    rcases hxCover with (hxSurp | hxOther) | hxInterior
    · exact Or.inr
        ⟨x, hxT, Or.inl
          (oppApex1_surplus_hit_strict_of_not_oppCap1
            D r hK4 hxT hxSurp hxNotOpp1)⟩
    · exact Or.inr
        ⟨x, hxT, Or.inr
          (oppApex1_other_hit_strict_of_not_oppCap1
            D r hK4 hxT hxOther hxNotOpp1)⟩
    · exact False.elim (hxNotOpp1 hxInterior.1)

/-- Second-apex containment either holds, or the remaining failure is a strict
adjacent-cap escape.  This removes the shared-endpoint cases from the residual. -/
theorem oppApex2_containment_or_strict_adjacent_escape
    (D : CounterexampleData) (r : ℝ)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card) :
    D.A.filter (fun x => dist x D.packet.oppApex2 = r) ⊆
        D.packet.oppCap2 ∨
      ∃ x, x ∈ D.A.filter (fun y => dist y D.packet.oppApex2 = r) ∧
        (x ∈ D.packet.surplusCap \
            (D.packet.oppCap2 ∪ D.packet.oppCap1) ∨
          x ∈ D.packet.oppCap1 \
            (D.packet.surplusCap ∪ D.packet.oppCap2)) := by
  classical
  by_cases hcont :
      D.A.filter (fun x => dist x D.packet.oppApex2 = r) ⊆
        D.packet.oppCap2
  · exact Or.inl hcont
  · simp only [Finset.subset_iff] at hcont
    push_neg at hcont
    obtain ⟨x, hxT, hxNotOpp2⟩ := hcont
    have hxCover := oppApex2_exactRadiusClass_cover D r hxT
    simp only [Finset.mem_union, Finset.mem_sdiff] at hxCover
    rcases hxCover with (hxSurp | hxOther) | hxInterior
    · exact Or.inr
        ⟨x, hxT, Or.inl
          (oppApex2_surplus_hit_strict_of_not_oppCap2
            D r hK4 hxT hxSurp hxNotOpp2)⟩
    · exact Or.inr
        ⟨x, hxT, Or.inr
          (oppApex2_other_hit_strict_of_not_oppCap2
            D r hK4 hxT hxOther hxNotOpp2)⟩
    · exact False.elim (hxNotOpp2 hxInterior.1)

private theorem surplusApexLocal_mem_oppCap1 (D : CounterexampleData) :
    surplusApexLocal D ∈ D.packet.oppCap1 := by
  set CP := D.packet.partition
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [surplusApexLocal, CP, SurplusCapPacket.oppCap1, hi] using
      CP.v1_mem_C2
  · simpa [surplusApexLocal, CP, SurplusCapPacket.oppCap1, hi] using
      CP.v2_mem_C3
  · simpa [surplusApexLocal, CP, SurplusCapPacket.oppCap1, hi] using
      CP.v3_mem_C1

private theorem surplusApexLocal_mem_oppCap2 (D : CounterexampleData) :
    surplusApexLocal D ∈ D.packet.oppCap2 := by
  set CP := D.packet.partition
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [surplusApexLocal, CP, SurplusCapPacket.oppCap2, hi] using
      CP.v1_mem_C3
  · simpa [surplusApexLocal, CP, SurplusCapPacket.oppCap2, hi] using
      CP.v2_mem_C1
  · simpa [surplusApexLocal, CP, SurplusCapPacket.oppCap2, hi] using
      CP.v3_mem_C2

/-- Under U1 endpoint-equality, the first-apex squeeze's two adjacent singleton
hits are the shared Moser endpoints `oppApex2` and `surplusApexLocal`. -/
theorem oppApex1_adjacent_hits_of_u1EndpointEquality
    (D : CounterexampleData) (r : ℝ)
    (hM44 : D.IsM44) (hEE : U1EndpointEquality D)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card) :
    (∃ s, s ∈ D.A.filter (fun x => dist x D.packet.oppApex1 = r) ∧
        s ∈ D.packet.oppCap1 ∧ s ∈ D.packet.surplusCap) ∧
      (∃ t, t ∈ D.A.filter (fun x => dist x D.packet.oppApex1 = r) ∧
        t ∈ D.packet.oppCap1 ∧ t ∈ D.packet.oppCap2) := by
  let T := D.A.filter (fun x => dist x D.packet.oppApex1 = r)
  let I := D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2)
  obtain ⟨r₁, _r₂, hCap1, _hCap2⟩ := hEE hM44
  have hIcard : I.card = 2 := by
    simpa [I] using oppApex1_interior_card_eq_two_of_isM44 hM44
  have hIpos : 0 < I.card := by
    omega
  obtain ⟨z, hzI⟩ := Finset.card_pos.mp hIpos
  have hIsub : I ⊆ T := by
    simpa [I, T] using (oppApex1_squeeze_of_isM44 D r hM44 hK4).2.1
  have hzT : z ∈ T := hIsub hzI
  have hzOpp : z ∈ D.packet.oppCap1 := (Finset.mem_sdiff.mp hzI).1
  have hzDistT : dist z D.packet.oppApex1 = r := (Finset.mem_filter.mp hzT).2
  have hzDistCap : dist z D.packet.oppApex1 = r₁ := hCap1 z hzOpp
  have hr₁ : r₁ = r := hzDistCap.symm.trans hzDistT
  have hsOpp : D.packet.oppApex2 ∈ D.packet.oppCap1 :=
    oppApex2_mem_oppCap1 D
  have hsT : D.packet.oppApex2 ∈ T := by
    refine Finset.mem_filter.mpr ⟨oppCap1_subset_A D hsOpp, ?_⟩
    exact (hCap1 D.packet.oppApex2 hsOpp).trans hr₁
  have htOpp : surplusApexLocal D ∈ D.packet.oppCap1 :=
    surplusApexLocal_mem_oppCap1 D
  have htT : surplusApexLocal D ∈ T := by
    refine Finset.mem_filter.mpr ⟨oppCap1_subset_A D htOpp, ?_⟩
    exact (hCap1 (surplusApexLocal D) htOpp).trans hr₁
  exact
    ⟨⟨D.packet.oppApex2, by simpa [T] using hsT, hsOpp,
        oppApex2_mem_surplusCap D⟩,
      ⟨surplusApexLocal D, by simpa [T] using htT, htOpp,
        surplusApexLocal_mem_oppCap2 D⟩⟩

/-- Under U1 endpoint-equality, the second-apex squeeze's two adjacent singleton
hits are the shared Moser endpoints `oppApex1` and `surplusApexLocal`. -/
theorem oppApex2_adjacent_hits_of_u1EndpointEquality
    (D : CounterexampleData) (r : ℝ)
    (hM44 : D.IsM44) (hEE : U1EndpointEquality D)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card) :
    (∃ s, s ∈ D.A.filter (fun x => dist x D.packet.oppApex2 = r) ∧
        s ∈ D.packet.oppCap2 ∧ s ∈ D.packet.surplusCap) ∧
      (∃ t, t ∈ D.A.filter (fun x => dist x D.packet.oppApex2 = r) ∧
        t ∈ D.packet.oppCap2 ∧ t ∈ D.packet.oppCap1) := by
  let T := D.A.filter (fun x => dist x D.packet.oppApex2 = r)
  let I := D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)
  obtain ⟨_r₁, r₂, _hCap1, hCap2⟩ := hEE hM44
  have hIcard : I.card = 2 := by
    simpa [I] using oppApex2_interior_card_eq_two_of_isM44 hM44
  have hIpos : 0 < I.card := by
    omega
  obtain ⟨z, hzI⟩ := Finset.card_pos.mp hIpos
  have hIsub : I ⊆ T := by
    simpa [I, T] using (oppApex2_squeeze_of_isM44 D r hM44 hK4).2.1
  have hzT : z ∈ T := hIsub hzI
  have hzOpp : z ∈ D.packet.oppCap2 := (Finset.mem_sdiff.mp hzI).1
  have hzDistT : dist z D.packet.oppApex2 = r := (Finset.mem_filter.mp hzT).2
  have hzDistCap : dist z D.packet.oppApex2 = r₂ := hCap2 z hzOpp
  have hr₂ : r₂ = r := hzDistCap.symm.trans hzDistT
  have hsOpp : D.packet.oppApex1 ∈ D.packet.oppCap2 :=
    oppApex1_mem_oppCap2 D
  have hsT : D.packet.oppApex1 ∈ T := by
    refine Finset.mem_filter.mpr ⟨oppCap2_subset_A D hsOpp, ?_⟩
    exact (hCap2 D.packet.oppApex1 hsOpp).trans hr₂
  have htOpp : surplusApexLocal D ∈ D.packet.oppCap2 :=
    surplusApexLocal_mem_oppCap2 D
  have htT : surplusApexLocal D ∈ T := by
    refine Finset.mem_filter.mpr ⟨oppCap2_subset_A D htOpp, ?_⟩
    exact (hCap2 (surplusApexLocal D) htOpp).trans hr₂
  exact
    ⟨⟨D.packet.oppApex1, by simpa [T] using hsT, hsOpp,
        oppApex1_mem_surplusCap D⟩,
      ⟨surplusApexLocal D, by simpa [T] using htT, htOpp,
        surplusApexLocal_mem_oppCap1 D⟩⟩

/-- U1 endpoint-equality supplies the concrete adjacent hits needed to turn the
first-apex non-surplus squeeze into cap-containment. -/
theorem oppApex1_containment_of_u1EndpointEquality
    (D : CounterexampleData) (r : ℝ)
    (hM44 : D.IsM44) (hEE : U1EndpointEquality D)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card) :
    D.A.filter (fun x => dist x D.packet.oppApex1 = r) ⊆
      D.packet.oppCap1 := by
  obtain ⟨hSurpHit, hOtherHit⟩ :=
    oppApex1_adjacent_hits_of_u1EndpointEquality D r hM44 hEE hK4
  exact oppApex1_containment_of_adjacent_hits D r hM44 hK4 hSurpHit hOtherHit

/-- U1 endpoint-equality supplies the concrete adjacent hits needed to turn the
second-apex non-surplus squeeze into cap-containment. -/
theorem oppApex2_containment_of_u1EndpointEquality
    (D : CounterexampleData) (r : ℝ)
    (hM44 : D.IsM44) (hEE : U1EndpointEquality D)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card) :
    D.A.filter (fun x => dist x D.packet.oppApex2 = r) ⊆
      D.packet.oppCap2 := by
  obtain ⟨hSurpHit, hOtherHit⟩ :=
    oppApex2_adjacent_hits_of_u1EndpointEquality D r hM44 hEE hK4
  exact oppApex2_containment_of_adjacent_hits D r hM44 hK4 hSurpHit hOtherHit

/-- U1 endpoint-equality supplies the endpoint-radius hypotheses needed by the
first-apex endpoint-radius wrapper at an actual K4 witness radius. -/
theorem oppApex1_endpointRadiusWitness_of_u1EndpointEquality
    (D : CounterexampleData) (hEE : U1EndpointEquality D) :
    D.IsM44 →
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card ∧
        dist D.packet.oppApex2 D.packet.oppApex1 = r ∧
        dist D.packet.surplusApex D.packet.oppApex1 = r := by
  intro hM44
  let T := fun r : ℝ => D.A.filter (fun x => dist x D.packet.oppApex1 = r)
  let I := D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2)
  have ha_mem : D.packet.oppApex1 ∈ D.A :=
    oppCap2_subset_A D (oppApex1_mem_oppCap2 D)
  obtain ⟨r, hr_pos, hcard_raw⟩ := D.K4 D.packet.oppApex1 ha_mem
  have hcard : 4 ≤ (T r).card := by
    simpa [T, dist_comm] using hcard_raw
  obtain ⟨r₁, _r₂, hCap1, _hCap2⟩ := hEE hM44
  have hIcard : I.card = 2 := by
    simpa [I] using oppApex1_interior_card_eq_two_of_isM44 hM44
  have hIpos : 0 < I.card := by
    omega
  obtain ⟨z, hzI⟩ := Finset.card_pos.mp hIpos
  have hIsub : I ⊆ T r := by
    simpa [I, T] using (oppApex1_squeeze_of_isM44 D r hM44 hcard).2.1
  have hzT : z ∈ T r := hIsub hzI
  have hzOpp : z ∈ D.packet.oppCap1 := (Finset.mem_sdiff.mp hzI).1
  have hzDistT : dist z D.packet.oppApex1 = r := (Finset.mem_filter.mp hzT).2
  have hzDistCap : dist z D.packet.oppApex1 = r₁ := hCap1 z hzOpp
  have hr₁ : r₁ = r := hzDistCap.symm.trans hzDistT
  have hOther :
      dist D.packet.oppApex2 D.packet.oppApex1 = r :=
    (hCap1 D.packet.oppApex2 (oppApex2_mem_oppCap1 D)).trans hr₁
  have hSurpMem : D.packet.surplusApex ∈ D.packet.oppCap1 := by
    simpa [surplusApexLocal, SurplusCapPacket.surplusApex] using
      surplusApexLocal_mem_oppCap1 D
  have hSurp :
      dist D.packet.surplusApex D.packet.oppApex1 = r :=
    (hCap1 D.packet.surplusApex hSurpMem).trans hr₁
  exact ⟨r, hr_pos, hcard, hOther, hSurp⟩

/-- U1 endpoint-equality supplies the endpoint-radius hypotheses needed by the
second-apex endpoint-radius wrapper at an actual K4 witness radius. -/
theorem oppApex2_endpointRadiusWitness_of_u1EndpointEquality
    (D : CounterexampleData) (hEE : U1EndpointEquality D) :
    D.IsM44 →
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card ∧
        dist D.packet.oppApex1 D.packet.oppApex2 = r ∧
        dist D.packet.surplusApex D.packet.oppApex2 = r := by
  intro hM44
  let T := fun r : ℝ => D.A.filter (fun x => dist x D.packet.oppApex2 = r)
  let I := D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)
  have ha_mem : D.packet.oppApex2 ∈ D.A :=
    oppCap1_subset_A D (oppApex2_mem_oppCap1 D)
  obtain ⟨r, hr_pos, hcard_raw⟩ := D.K4 D.packet.oppApex2 ha_mem
  have hcard : 4 ≤ (T r).card := by
    simpa [T, dist_comm] using hcard_raw
  obtain ⟨_r₁, r₂, _hCap1, hCap2⟩ := hEE hM44
  have hIcard : I.card = 2 := by
    simpa [I] using oppApex2_interior_card_eq_two_of_isM44 hM44
  have hIpos : 0 < I.card := by
    omega
  obtain ⟨z, hzI⟩ := Finset.card_pos.mp hIpos
  have hIsub : I ⊆ T r := by
    simpa [I, T] using (oppApex2_squeeze_of_isM44 D r hM44 hcard).2.1
  have hzT : z ∈ T r := hIsub hzI
  have hzOpp : z ∈ D.packet.oppCap2 := (Finset.mem_sdiff.mp hzI).1
  have hzDistT : dist z D.packet.oppApex2 = r := (Finset.mem_filter.mp hzT).2
  have hzDistCap : dist z D.packet.oppApex2 = r₂ := hCap2 z hzOpp
  have hr₂ : r₂ = r := hzDistCap.symm.trans hzDistT
  have hOther :
      dist D.packet.oppApex1 D.packet.oppApex2 = r :=
    (hCap2 D.packet.oppApex1 (oppApex1_mem_oppCap2 D)).trans hr₂
  have hSurpMem : D.packet.surplusApex ∈ D.packet.oppCap2 := by
    simpa [surplusApexLocal, SurplusCapPacket.surplusApex] using
      surplusApexLocal_mem_oppCap2 D
  have hSurp :
      dist D.packet.surplusApex D.packet.oppApex2 = r :=
    (hCap2 D.packet.surplusApex hSurpMem).trans hr₂
  exact ⟨r, hr_pos, hcard, hOther, hSurp⟩

/-- Radical-axis sign obstruction in the normalized first-apex frame.

In the frame `v₂ = (0,-1)`, `v₁ = (x,y)`, `v₃ = (-x,y)`,
`p = (u,v)`, the three equalities say `v₁` and `p` lie on the
same radius-`r` circle about `v₂`, while `v₁` lies on the unit MEC circle.
The signed-area hypotheses put the apex chord and `p` on the strict side that
would be required by the adjacent escape.  The radical-axis identity then
expresses a sum of two nonnegative terms, one strictly positive, as zero. -/
theorem no_adjacent_escape_on_apex_radius
    (x y u v r : ℝ)
    (hcircle : x ^ 2 + y ^ 2 = 1)
    (hv1dist : x ^ 2 + (y + 1) ^ 2 = r)
    (hpdist : u ^ 2 + (v + 1) ^ 2 = r)
    (hr : 0 < r)
    (hpDisk : u ^ 2 + v ^ 2 ≤ 1)
    (hApex : 0 < (-2 * x) * (1 + y))
    (hOutC2 : 0 < (-2 * x) * (y - v)) : False := by
  have hslack : 0 ≤ 1 - u ^ 2 - v ^ 2 := by
    nlinarith [hpDisk]
  have hpos :
      0 < (-2 * x) * (y - v) * r := by
    exact mul_pos hOutC2 hr
  have hnonneg :
      0 ≤ (-2 * x) * (1 + y) * (1 - u ^ 2 - v ^ 2) := by
    exact mul_nonneg (le_of_lt hApex) hslack
  have hEp : u ^ 2 + (v + 1) ^ 2 - r = 0 := by
    nlinarith [hpdist]
  have hE1 : x ^ 2 + (y + 1) ^ 2 - r = 0 := by
    nlinarith [hv1dist]
  have hEc : x ^ 2 + y ^ 2 - 1 = 0 := by
    nlinarith [hcircle]
  have hid :
      (-2 * x) * (y - v) * r +
          (-2 * x) * (1 + y) * (1 - u ^ 2 - v ^ 2) = 0 := by
    calc
      (-2 * x) * (y - v) * r +
          (-2 * x) * (1 + y) * (1 - u ^ 2 - v ^ 2)
          =
            2 * x * (y + 1) * (u ^ 2 + (v + 1) ^ 2 - r)
              - 2 * x * (v + 1) * (x ^ 2 + (y + 1) ^ 2 - r)
              + 2 * x * (v + 1) * (x ^ 2 + y ^ 2 - 1) := by
            ring
      _ = 0 := by
        rw [hEp, hE1, hEc]
        ring
  nlinarith [hpos, hnonneg, hid]

/-- The strict adjacent-cap escape branch for the first non-surplus apex at a
fixed radius.  This is exactly the right branch of
`oppApex1_containment_or_strict_adjacent_escape`. -/
def StrictAdjacentEscapeAtOppApex1 (D : CounterexampleData) (r : ℝ) : Prop :=
  ∃ x, x ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r) ∧
    (x ∈ D.packet.surplusCap \
        (D.packet.oppCap1 ∪ D.packet.oppCap2) ∨
      x ∈ D.packet.oppCap2 \
        (D.packet.surplusCap ∪ D.packet.oppCap1))

/-- The strict adjacent-cap escape branch for the second non-surplus apex at a
fixed radius.  This is exactly the right branch of
`oppApex2_containment_or_strict_adjacent_escape`. -/
def StrictAdjacentEscapeAtOppApex2 (D : CounterexampleData) (r : ℝ) : Prop :=
  ∃ x, x ∈ D.A.filter (fun y => dist y D.packet.oppApex2 = r) ∧
    (x ∈ D.packet.surplusCap \
        (D.packet.oppCap2 ∪ D.packet.oppCap1) ∨
      x ∈ D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2))

/-- Endpoint-radius containment rules out the first-apex strict adjacent
escape branch.  This isolates the remaining route-B input: to use the
radical-axis/disk obstruction at the spine leaf, one must produce the two
endpoint-radius hypotheses for the queried class. -/
theorem not_strictAdjacentEscapeAtOppApex1_of_endpointRadius
    (D : CounterexampleData) {r : ℝ} (hr : 0 < r)
    (hOther : dist D.packet.oppApex2 D.packet.oppApex1 = r)
    (hSurp : dist D.packet.surplusApex D.packet.oppApex1 = r) :
    ¬ StrictAdjacentEscapeAtOppApex1 D r := by
  intro hEsc
  obtain ⟨x, hxT, hxEsc⟩ := hEsc
  have hxOpp1 : x ∈ D.packet.oppCap1 :=
    oppApex1_filter_subset_oppCap1_of_endpointRadius D hr hOther hSurp hxT
  rcases hxEsc with hxSurpStrict | hxOtherStrict
  · exact (Finset.mem_sdiff.mp hxSurpStrict).2
      (Finset.mem_union.mpr (Or.inl hxOpp1))
  · exact (Finset.mem_sdiff.mp hxOtherStrict).2
      (Finset.mem_union.mpr (Or.inr hxOpp1))

/-- Endpoint-radius containment rules out the second-apex strict adjacent
escape branch. -/
theorem not_strictAdjacentEscapeAtOppApex2_of_endpointRadius
    (D : CounterexampleData) {r : ℝ} (hr : 0 < r)
    (hOther : dist D.packet.oppApex1 D.packet.oppApex2 = r)
    (hSurp : dist D.packet.surplusApex D.packet.oppApex2 = r) :
    ¬ StrictAdjacentEscapeAtOppApex2 D r := by
  intro hEsc
  obtain ⟨x, hxT, hxEsc⟩ := hEsc
  have hxOpp2 : x ∈ D.packet.oppCap2 :=
    oppApex2_filter_subset_oppCap2_of_endpointRadius D hr hOther hSurp hxT
  rcases hxEsc with hxSurpStrict | hxOtherStrict
  · exact (Finset.mem_sdiff.mp hxSurpStrict).2
      (Finset.mem_union.mpr (Or.inl hxOpp2))
  · exact (Finset.mem_sdiff.mp hxOtherStrict).2
      (Finset.mem_union.mpr (Or.inr hxOpp2))

/-- No strict adjacent-cap escape occurs at any K4-sized exact-radius class
around the first non-surplus apex in the `(m,4,4)` regime. -/
def NoStrictAdjacentEscapeAtOppApex1 (D : CounterexampleData) : Prop :=
  D.IsM44 → ∀ r : ℝ, 0 < r →
    4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card →
      ¬ StrictAdjacentEscapeAtOppApex1 D r

/-- No strict adjacent-cap escape occurs at any K4-sized exact-radius class
around the second non-surplus apex in the `(m,4,4)` regime. -/
def NoStrictAdjacentEscapeAtOppApex2 (D : CounterexampleData) : Prop :=
  D.IsM44 → ∀ r : ℝ, 0 < r →
    4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card →
      ¬ StrictAdjacentEscapeAtOppApex2 D r

private noncomputable def swap23NonObtuse {A : Finset ℝ²} (S : SurplusCapPacket A) :
    MEC.NonObtuseCircumscribedMoserTriangle A S.hA S.hncol := {
  toMoserTriangle := {
    v1 := S.triangleNonObtuse.toMoserTriangle.v1
    v2 := S.triangleNonObtuse.toMoserTriangle.v3
    v3 := S.triangleNonObtuse.toMoserTriangle.v2
    v1_mem := S.triangleNonObtuse.toMoserTriangle.v1_mem
    v2_mem := S.triangleNonObtuse.toMoserTriangle.v3_mem
    v3_mem := S.triangleNonObtuse.toMoserTriangle.v2_mem
    v1_boundary := S.triangleNonObtuse.toMoserTriangle.v1_boundary
    v2_boundary := S.triangleNonObtuse.toMoserTriangle.v3_boundary
    v3_boundary := S.triangleNonObtuse.toMoserTriangle.v2_boundary
    case_split := by
      obtain ⟨h12, h23, h13, _⟩ := S.hCirc
      exact Or.inl ⟨h13, h23.symm, h12⟩ }
  inner_at_v1 := by
    simpa [real_inner_comm] using S.triangleNonObtuse.inner_at_v1
  inner_at_v2 := by
    simpa [real_inner_comm] using S.triangleNonObtuse.inner_at_v3
  inner_at_v3 := by
    simpa [real_inner_comm] using S.triangleNonObtuse.inner_at_v2 }

private theorem swap23_hCirc {A : Finset ℝ²} (S : SurplusCapPacket A) :
    ∃ h12 h23 h13,
      (swap23NonObtuse S).toMoserTriangle.case_split =
        Or.inl ⟨h12, h23, h13⟩ := by
  obtain ⟨h12, h23, h13, _⟩ := S.hCirc
  exact ⟨h13, h23.symm, h12, rfl⟩

private noncomputable def swap13NonObtuse {A : Finset ℝ²} (S : SurplusCapPacket A) :
    MEC.NonObtuseCircumscribedMoserTriangle A S.hA S.hncol := {
  toMoserTriangle := {
    v1 := S.triangleNonObtuse.toMoserTriangle.v3
    v2 := S.triangleNonObtuse.toMoserTriangle.v2
    v3 := S.triangleNonObtuse.toMoserTriangle.v1
    v1_mem := S.triangleNonObtuse.toMoserTriangle.v3_mem
    v2_mem := S.triangleNonObtuse.toMoserTriangle.v2_mem
    v3_mem := S.triangleNonObtuse.toMoserTriangle.v1_mem
    v1_boundary := S.triangleNonObtuse.toMoserTriangle.v3_boundary
    v2_boundary := S.triangleNonObtuse.toMoserTriangle.v2_boundary
    v3_boundary := S.triangleNonObtuse.toMoserTriangle.v1_boundary
    case_split := by
      obtain ⟨h12, h23, h13, _⟩ := S.hCirc
      exact Or.inl ⟨h23.symm, h12.symm, h13.symm⟩ }
  inner_at_v1 := by
    simpa [real_inner_comm] using S.triangleNonObtuse.inner_at_v3
  inner_at_v2 := by
    simpa [real_inner_comm] using S.triangleNonObtuse.inner_at_v2
  inner_at_v3 := by
    simpa [real_inner_comm] using S.triangleNonObtuse.inner_at_v1 }

private theorem swap13_hCirc {A : Finset ℝ²} (S : SurplusCapPacket A) :
    ∃ h12 h23 h13,
      (swap13NonObtuse S).toMoserTriangle.case_split =
        Or.inl ⟨h12, h23, h13⟩ := by
  obtain ⟨h12, h23, h13, _⟩ := S.hCirc
  exact ⟨h23.symm, h12.symm, h13.symm, rfl⟩

private noncomputable def swap12NonObtuse {A : Finset ℝ²} (S : SurplusCapPacket A) :
    MEC.NonObtuseCircumscribedMoserTriangle A S.hA S.hncol := {
  toMoserTriangle := {
    v1 := S.triangleNonObtuse.toMoserTriangle.v2
    v2 := S.triangleNonObtuse.toMoserTriangle.v1
    v3 := S.triangleNonObtuse.toMoserTriangle.v3
    v1_mem := S.triangleNonObtuse.toMoserTriangle.v2_mem
    v2_mem := S.triangleNonObtuse.toMoserTriangle.v1_mem
    v3_mem := S.triangleNonObtuse.toMoserTriangle.v3_mem
    v1_boundary := S.triangleNonObtuse.toMoserTriangle.v2_boundary
    v2_boundary := S.triangleNonObtuse.toMoserTriangle.v1_boundary
    v3_boundary := S.triangleNonObtuse.toMoserTriangle.v3_boundary
    case_split := by
      obtain ⟨h12, h23, h13, _⟩ := S.hCirc
      exact Or.inl ⟨h12.symm, h13, h23⟩ }
  inner_at_v1 := by
    simpa [real_inner_comm] using S.triangleNonObtuse.inner_at_v2
  inner_at_v2 := by
    simpa [real_inner_comm] using S.triangleNonObtuse.inner_at_v1
  inner_at_v3 := by
    simpa [real_inner_comm] using S.triangleNonObtuse.inner_at_v3 }

private theorem swap12_hCirc {A : Finset ℝ²} (S : SurplusCapPacket A) :
    ∃ h12 h23 h13,
      (swap12NonObtuse S).toMoserTriangle.case_split =
        Or.inl ⟨h12, h23, h13⟩ := by
  obtain ⟨h12, h23, h13, _⟩ := S.hCirc
  exact ⟨h12.symm, h13, h23, rfl⟩

private theorem not_mem_verts_swap23 {A : Finset ℝ²} (S : SurplusCapPacket A)
    {v : ℝ²}
    (hv : v ∉ ((swap23NonObtuse S).toMoserTriangle.toStructural
      (swap23_hCirc S)).verts) : v ∉ S.triangle.verts := by
  intro hvOld
  apply hv
  simp only [MoserTriangle.verts, SurplusCapPacket.triangle, swap23NonObtuse,
    Finset.mem_insert, Finset.mem_singleton] at hvOld ⊢
  rcases hvOld with h | h | h
  · exact Or.inl h
  · exact Or.inr (Or.inr h)
  · exact Or.inr (Or.inl h)

private theorem not_mem_verts_swap13 {A : Finset ℝ²} (S : SurplusCapPacket A)
    {v : ℝ²}
    (hv : v ∉ ((swap13NonObtuse S).toMoserTriangle.toStructural
      (swap13_hCirc S)).verts) : v ∉ S.triangle.verts := by
  intro hvOld
  apply hv
  simp only [MoserTriangle.verts, SurplusCapPacket.triangle, swap13NonObtuse,
    Finset.mem_insert, Finset.mem_singleton] at hvOld ⊢
  rcases hvOld with h | h | h
  · exact Or.inr (Or.inr h)
  · exact Or.inr (Or.inl h)
  · exact Or.inl h

private theorem not_mem_verts_swap12 {A : Finset ℝ²} (S : SurplusCapPacket A)
    {v : ℝ²}
    (hv : v ∉ ((swap12NonObtuse S).toMoserTriangle.toStructural
      (swap12_hCirc S)).verts) : v ∉ S.triangle.verts := by
  intro hvOld
  apply hv
  simp only [MoserTriangle.verts, SurplusCapPacket.triangle, swap12NonObtuse,
    Finset.mem_insert, Finset.mem_singleton] at hvOld ⊢
  rcases hvOld with h | h | h
  · exact Or.inr (Or.inl h)
  · exact Or.inl h
  · exact Or.inr (Or.inr h)

private noncomputable def swap23Partition {A : Finset ℝ²} (S : SurplusCapPacket A) :
    CapTriple A ((swap23NonObtuse S).toMoserTriangle.toStructural
      (swap23_hCirc S)) := {
  C1 := S.partition.C1
  C2 := S.partition.C3
  C3 := S.partition.C2
  C1_subset := S.partition.C1_subset
  C2_subset := S.partition.C3_subset
  C3_subset := S.partition.C2_subset
  v1_notin_C1 := S.partition.v1_notin_C1
  v2_mem_C1 := S.partition.v3_mem_C1
  v3_mem_C1 := S.partition.v2_mem_C1
  v1_mem_C2 := S.partition.v1_mem_C3
  v2_notin_C2 := S.partition.v3_notin_C3
  v3_mem_C2 := S.partition.v2_mem_C3
  v1_mem_C3 := S.partition.v1_mem_C2
  v2_mem_C3 := S.partition.v3_mem_C2
  v3_notin_C3 := S.partition.v2_notin_C2
  nonmoser_in_one := by
    classical
    intro v hvA hv
    have hvOld := not_mem_verts_swap23 S hv
    simpa [add_assoc, add_comm, add_left_comm]
      using S.partition.nonmoser_in_one v hvA hvOld
  arc_membership := by
    intro v hvA
    have h := S.partition.arc_membership v hvA
    exact ⟨
      by
        simpa [swap23NonObtuse] using
          h.1.trans (onArcOpposite_swap_chord _ _ _ _),
      by
        simpa [swap23NonObtuse] using
          (h.2.2.trans (onArcOpposite_swap_chord _ _ _ _)),
      by
        simpa [swap23NonObtuse] using
          (h.2.1.trans (onArcOpposite_swap_chord _ _ _ _))⟩ }

private noncomputable def swap13Partition {A : Finset ℝ²} (S : SurplusCapPacket A) :
    CapTriple A ((swap13NonObtuse S).toMoserTriangle.toStructural
      (swap13_hCirc S)) := {
  C1 := S.partition.C3
  C2 := S.partition.C2
  C3 := S.partition.C1
  C1_subset := S.partition.C3_subset
  C2_subset := S.partition.C2_subset
  C3_subset := S.partition.C1_subset
  v1_notin_C1 := S.partition.v3_notin_C3
  v2_mem_C1 := S.partition.v2_mem_C3
  v3_mem_C1 := S.partition.v1_mem_C3
  v1_mem_C2 := S.partition.v3_mem_C2
  v2_notin_C2 := S.partition.v2_notin_C2
  v3_mem_C2 := S.partition.v1_mem_C2
  v1_mem_C3 := S.partition.v3_mem_C1
  v2_mem_C3 := S.partition.v2_mem_C1
  v3_notin_C3 := S.partition.v1_notin_C1
  nonmoser_in_one := by
    classical
    intro v hvA hv
    have hvOld := not_mem_verts_swap13 S hv
    simpa [add_assoc, add_comm, add_left_comm]
      using S.partition.nonmoser_in_one v hvA hvOld
  arc_membership := by
    intro v hvA
    have h := S.partition.arc_membership v hvA
    exact ⟨
      by
        simpa [swap13NonObtuse] using
          (h.2.2.trans (onArcOpposite_swap_chord _ _ _ _)),
      by
        simpa [swap13NonObtuse] using
          (h.2.1.trans (onArcOpposite_swap_chord _ _ _ _)),
      by
        simpa [swap13NonObtuse] using
          (h.1.trans (onArcOpposite_swap_chord _ _ _ _))⟩ }

private noncomputable def swap12Partition {A : Finset ℝ²} (S : SurplusCapPacket A) :
    CapTriple A ((swap12NonObtuse S).toMoserTriangle.toStructural
      (swap12_hCirc S)) := {
  C1 := S.partition.C2
  C2 := S.partition.C1
  C3 := S.partition.C3
  C1_subset := S.partition.C2_subset
  C2_subset := S.partition.C1_subset
  C3_subset := S.partition.C3_subset
  v1_notin_C1 := S.partition.v2_notin_C2
  v2_mem_C1 := S.partition.v1_mem_C2
  v3_mem_C1 := S.partition.v3_mem_C2
  v1_mem_C2 := S.partition.v2_mem_C1
  v2_notin_C2 := S.partition.v1_notin_C1
  v3_mem_C2 := S.partition.v3_mem_C1
  v1_mem_C3 := S.partition.v2_mem_C3
  v2_mem_C3 := S.partition.v1_mem_C3
  v3_notin_C3 := S.partition.v3_notin_C3
  nonmoser_in_one := by
    classical
    intro v hvA hv
    have hvOld := not_mem_verts_swap12 S hv
    simpa [add_assoc, add_comm, add_left_comm]
      using S.partition.nonmoser_in_one v hvA hvOld
  arc_membership := by
    intro v hvA
    have h := S.partition.arc_membership v hvA
    exact ⟨
      by
        simpa [swap12NonObtuse] using
          (h.2.1.trans (onArcOpposite_swap_chord _ _ _ _)),
      by
        simpa [swap12NonObtuse] using
          (h.1.trans (onArcOpposite_swap_chord _ _ _ _)),
      by
        simpa [swap12NonObtuse] using
          (h.2.2.trans (onArcOpposite_swap_chord _ _ _ _))⟩ }

private noncomputable def fixedSurplusSwapPacket0 (D : CounterexampleData)
    (hidx : D.packet.surplusIdx = (⟨0, by decide⟩ : Fin 3)) :
    SurplusCapPacket D.A := {
  hA := D.packet.hA
  hncol := D.packet.hncol
  triangleNonObtuse := swap23NonObtuse D.packet
  hCirc := swap23_hCirc D.packet
  partition := swap23Partition D.packet
  surplusIdx := ⟨0, by decide⟩
  surplus := by
    have h := D.packet.surplus
    rw [hidx] at h
    simpa [swap23Partition] using h }

private noncomputable def fixedSurplusSwapPacket1 (D : CounterexampleData)
    (hidx : D.packet.surplusIdx = (⟨1, by decide⟩ : Fin 3)) :
    SurplusCapPacket D.A := {
  hA := D.packet.hA
  hncol := D.packet.hncol
  triangleNonObtuse := swap13NonObtuse D.packet
  hCirc := swap13_hCirc D.packet
  partition := swap13Partition D.packet
  surplusIdx := ⟨1, by decide⟩
  surplus := by
    have h := D.packet.surplus
    rw [hidx] at h
    simpa [swap13Partition] using h }

private noncomputable def fixedSurplusSwapPacket2 (D : CounterexampleData)
    (hidx : D.packet.surplusIdx = (⟨2, by decide⟩ : Fin 3)) :
    SurplusCapPacket D.A := {
  hA := D.packet.hA
  hncol := D.packet.hncol
  triangleNonObtuse := swap12NonObtuse D.packet
  hCirc := swap12_hCirc D.packet
  partition := swap12Partition D.packet
  surplusIdx := ⟨2, by decide⟩
  surplus := by
    have h := D.packet.surplus
    rw [hidx] at h
    simpa [swap12Partition] using h }

/-- When the surplus cap is indexed by `0`, transposing the two non-surplus
vertices turns the left pinned residual into the right pinned residual. -/
private theorem fixedSurplusSwapPacket0_pinnedLeft_to_right
    (D : CounterexampleData)
    (hidx : D.packet.surplusIdx = (⟨0, by decide⟩ : Fin 3))
    {radius : ℝ} {x : ℝ²}
    (hpinned : D.packet.PinnedLeftSurplusResidualAt radius x) :
    (fixedSurplusSwapPacket0 D hidx).PinnedRightSurplusResidualAt radius x := by
  have hcenter :
      (fixedSurplusSwapPacket0 D hidx).oppositeVertexByIndex
          (fixedSurplusSwapPacket0 D hidx).oppIndex1 =
        D.packet.oppositeVertexByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket0, swap23NonObtuse,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, SurplusCapPacket.triangle,
      MEC.MoserTriangle.toStructural, hidx]
  have hinterior :
      (fixedSurplusSwapPacket0 D hidx).capInteriorByIndex
          (fixedSurplusSwapPacket0 D hidx).oppIndex1 =
        D.packet.capInteriorByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket0, swap23NonObtuse, swap23Partition,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capInteriorByIndex, SurplusCapPacket.triangle,
      MEC.MoserTriangle.toStructural, hidx, Finset.erase_right_comm]
  have hown :
      (fixedSurplusSwapPacket0 D hidx).capByIndex
          (fixedSurplusSwapPacket0 D hidx).oppIndex1 =
        D.packet.capByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket0, swap23Partition,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capByIndex, hidx]
  have hleftOuter :
      (fixedSurplusSwapPacket0 D hidx).leftOuterVertexByIndex
          (fixedSurplusSwapPacket0 D hidx).oppIndex1 =
        D.packet.rightOuterVertexByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket0, swap23NonObtuse,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.leftOuterVertexByIndex,
      SurplusCapPacket.rightOuterVertexByIndex, SurplusCapPacket.triangle,
      MEC.MoserTriangle.toStructural, hidx]
  have hrightOuter :
      (fixedSurplusSwapPacket0 D hidx).rightOuterVertexByIndex
          (fixedSurplusSwapPacket0 D hidx).oppIndex1 =
        D.packet.leftOuterVertexByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket0, swap23NonObtuse,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.leftOuterVertexByIndex,
      SurplusCapPacket.rightOuterVertexByIndex, SurplusCapPacket.triangle,
      MEC.MoserTriangle.toStructural, hidx]
  have hleftAdjacent :
      (fixedSurplusSwapPacket0 D hidx).leftAdjacentCapByIndex
          (fixedSurplusSwapPacket0 D hidx).oppIndex1 =
        D.packet.rightAdjacentCapByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket0, swap23Partition,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.leftAdjacentCapByIndex,
      SurplusCapPacket.rightAdjacentCapByIndex,
      SurplusCapPacket.capByIndex, hidx]
  have hrightAdjacent :
      (fixedSurplusSwapPacket0 D hidx).rightAdjacentCapByIndex
          (fixedSurplusSwapPacket0 D hidx).oppIndex1 =
        D.packet.leftAdjacentCapByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket0, swap23Partition,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.leftAdjacentCapByIndex,
      SurplusCapPacket.rightAdjacentCapByIndex,
      SurplusCapPacket.capByIndex, hidx]
  rcases hpinned with
    ⟨p₁, p₂, hpne, hpair, hcard, hsub, hright, hx, hxSurplus,
      hleftEq, hrightEq, hright_ne, hleft_ne⟩
  refine ⟨p₁, p₂, hpne, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · rw [hinterior]
    exact hpair
  · rw [hcenter]
    exact hcard
  · rw [hinterior, hcenter]
    exact hsub
  · rw [hleftOuter, hcenter]
    exact hright
  · rw [hcenter]
    exact hx
  · rw [hrightAdjacent, hown, hleftAdjacent]
    exact hxSurplus
  · rw [hcenter, hleftAdjacent, hleftOuter]
    exact hrightEq
  · rw [hcenter, hrightAdjacent]
    exact hleftEq
  · rw [hrightOuter]
    exact hleft_ne
  · rw [hleftOuter]
    exact hright_ne

/-- When the surplus cap is indexed by `1`, transposing the two non-surplus
vertices turns the left pinned residual into the right pinned residual. -/
private theorem fixedSurplusSwapPacket1_pinnedLeft_to_right
    (D : CounterexampleData)
    (hidx : D.packet.surplusIdx = (⟨1, by decide⟩ : Fin 3))
    {radius : ℝ} {x : ℝ²}
    (hpinned : D.packet.PinnedLeftSurplusResidualAt radius x) :
    (fixedSurplusSwapPacket1 D hidx).PinnedRightSurplusResidualAt radius x := by
  have hcenter :
      (fixedSurplusSwapPacket1 D hidx).oppositeVertexByIndex
          (fixedSurplusSwapPacket1 D hidx).oppIndex1 =
        D.packet.oppositeVertexByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket1, swap13NonObtuse,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, SurplusCapPacket.triangle,
      MEC.MoserTriangle.toStructural, hidx]
  have hinterior :
      (fixedSurplusSwapPacket1 D hidx).capInteriorByIndex
          (fixedSurplusSwapPacket1 D hidx).oppIndex1 =
        D.packet.capInteriorByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket1, swap13NonObtuse, swap13Partition,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capInteriorByIndex, SurplusCapPacket.triangle,
      MEC.MoserTriangle.toStructural, hidx, Finset.erase_right_comm]
  have hown :
      (fixedSurplusSwapPacket1 D hidx).capByIndex
          (fixedSurplusSwapPacket1 D hidx).oppIndex1 =
        D.packet.capByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket1, swap13Partition,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capByIndex, hidx]
  have hleftOuter :
      (fixedSurplusSwapPacket1 D hidx).leftOuterVertexByIndex
          (fixedSurplusSwapPacket1 D hidx).oppIndex1 =
        D.packet.rightOuterVertexByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket1, swap13NonObtuse,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.leftOuterVertexByIndex,
      SurplusCapPacket.rightOuterVertexByIndex, SurplusCapPacket.triangle,
      MEC.MoserTriangle.toStructural, hidx]
  have hrightOuter :
      (fixedSurplusSwapPacket1 D hidx).rightOuterVertexByIndex
          (fixedSurplusSwapPacket1 D hidx).oppIndex1 =
        D.packet.leftOuterVertexByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket1, swap13NonObtuse,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.leftOuterVertexByIndex,
      SurplusCapPacket.rightOuterVertexByIndex, SurplusCapPacket.triangle,
      MEC.MoserTriangle.toStructural, hidx]
  have hleftAdjacent :
      (fixedSurplusSwapPacket1 D hidx).leftAdjacentCapByIndex
          (fixedSurplusSwapPacket1 D hidx).oppIndex1 =
        D.packet.rightAdjacentCapByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket1, swap13Partition,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.leftAdjacentCapByIndex,
      SurplusCapPacket.rightAdjacentCapByIndex,
      SurplusCapPacket.capByIndex, hidx]
  have hrightAdjacent :
      (fixedSurplusSwapPacket1 D hidx).rightAdjacentCapByIndex
          (fixedSurplusSwapPacket1 D hidx).oppIndex1 =
        D.packet.leftAdjacentCapByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket1, swap13Partition,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.leftAdjacentCapByIndex,
      SurplusCapPacket.rightAdjacentCapByIndex,
      SurplusCapPacket.capByIndex, hidx]
  rcases hpinned with
    ⟨p₁, p₂, hpne, hpair, hcard, hsub, hright, hx, hxSurplus,
      hleftEq, hrightEq, hright_ne, hleft_ne⟩
  refine ⟨p₁, p₂, hpne, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · rw [hinterior]
    exact hpair
  · rw [hcenter]
    exact hcard
  · rw [hinterior, hcenter]
    exact hsub
  · rw [hleftOuter, hcenter]
    exact hright
  · rw [hcenter]
    exact hx
  · rw [hrightAdjacent, hown, hleftAdjacent]
    exact hxSurplus
  · rw [hcenter, hleftAdjacent, hleftOuter]
    exact hrightEq
  · rw [hcenter, hrightAdjacent]
    exact hleftEq
  · rw [hrightOuter]
    exact hleft_ne
  · rw [hleftOuter]
    exact hright_ne

/-- When the surplus cap is indexed by `2`, transposing the two non-surplus
vertices turns the left pinned residual into the right pinned residual. -/
private theorem fixedSurplusSwapPacket2_pinnedLeft_to_right
    (D : CounterexampleData)
    (hidx : D.packet.surplusIdx = (⟨2, by decide⟩ : Fin 3))
    {radius : ℝ} {x : ℝ²}
    (hpinned : D.packet.PinnedLeftSurplusResidualAt radius x) :
    (fixedSurplusSwapPacket2 D hidx).PinnedRightSurplusResidualAt radius x := by
  have hcenter :
      (fixedSurplusSwapPacket2 D hidx).oppositeVertexByIndex
          (fixedSurplusSwapPacket2 D hidx).oppIndex1 =
        D.packet.oppositeVertexByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket2, swap12NonObtuse,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, SurplusCapPacket.triangle,
      MEC.MoserTriangle.toStructural, hidx]
  have hinterior :
      (fixedSurplusSwapPacket2 D hidx).capInteriorByIndex
          (fixedSurplusSwapPacket2 D hidx).oppIndex1 =
        D.packet.capInteriorByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket2, swap12NonObtuse, swap12Partition,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capInteriorByIndex, SurplusCapPacket.triangle,
      MEC.MoserTriangle.toStructural, hidx, Finset.erase_right_comm]
  have hown :
      (fixedSurplusSwapPacket2 D hidx).capByIndex
          (fixedSurplusSwapPacket2 D hidx).oppIndex1 =
        D.packet.capByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket2, swap12Partition,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capByIndex, hidx]
  have hleftOuter :
      (fixedSurplusSwapPacket2 D hidx).leftOuterVertexByIndex
          (fixedSurplusSwapPacket2 D hidx).oppIndex1 =
        D.packet.rightOuterVertexByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket2, swap12NonObtuse,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.leftOuterVertexByIndex,
      SurplusCapPacket.rightOuterVertexByIndex, SurplusCapPacket.triangle,
      MEC.MoserTriangle.toStructural, hidx]
  have hrightOuter :
      (fixedSurplusSwapPacket2 D hidx).rightOuterVertexByIndex
          (fixedSurplusSwapPacket2 D hidx).oppIndex1 =
        D.packet.leftOuterVertexByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket2, swap12NonObtuse,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.leftOuterVertexByIndex,
      SurplusCapPacket.rightOuterVertexByIndex, SurplusCapPacket.triangle,
      MEC.MoserTriangle.toStructural, hidx]
  have hleftAdjacent :
      (fixedSurplusSwapPacket2 D hidx).leftAdjacentCapByIndex
          (fixedSurplusSwapPacket2 D hidx).oppIndex1 =
        D.packet.rightAdjacentCapByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket2, swap12Partition,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.leftAdjacentCapByIndex,
      SurplusCapPacket.rightAdjacentCapByIndex,
      SurplusCapPacket.capByIndex, hidx]
  have hrightAdjacent :
      (fixedSurplusSwapPacket2 D hidx).rightAdjacentCapByIndex
          (fixedSurplusSwapPacket2 D hidx).oppIndex1 =
        D.packet.leftAdjacentCapByIndex D.packet.oppIndex2 := by
    simp [fixedSurplusSwapPacket2, swap12Partition,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.leftAdjacentCapByIndex,
      SurplusCapPacket.rightAdjacentCapByIndex,
      SurplusCapPacket.capByIndex, hidx]
  rcases hpinned with
    ⟨p₁, p₂, hpne, hpair, hcard, hsub, hright, hx, hxSurplus,
      hleftEq, hrightEq, hright_ne, hleft_ne⟩
  refine ⟨p₁, p₂, hpne, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · rw [hinterior]
    exact hpair
  · rw [hcenter]
    exact hcard
  · rw [hinterior, hcenter]
    exact hsub
  · rw [hleftOuter, hcenter]
    exact hright
  · rw [hcenter]
    exact hx
  · rw [hrightAdjacent, hown, hleftAdjacent]
    exact hxSurplus
  · rw [hcenter, hleftAdjacent, hleftOuter]
    exact hrightEq
  · rw [hcenter, hrightAdjacent]
    exact hleftEq
  · rw [hrightOuter]
    exact hleft_ne
  · rw [hleftOuter]
    exact hright_ne

/-- A datum `Dsw` is the fixed-surplus non-surplus swap of `D`.  It keeps the
carrier and surplus cap, exchanges the two non-surplus caps and their opposite
Moser apices, and reflects a left pinned residual into a right pinned residual. -/
structure NonSurplusSwap (D Dsw : CounterexampleData) : Prop where
  /-- The swapped datum lives on the same carrier. -/
  carrier_eq : Dsw.A = D.A
  /-- The first swapped non-surplus apex is the original second one. -/
  oppApex1_eq : Dsw.packet.oppApex1 = D.packet.oppApex2
  /-- The first swapped non-surplus cap is the original second one. -/
  oppCap1_eq : Dsw.packet.oppCap1 = D.packet.oppCap2
  /-- The second swapped non-surplus cap is the original first one. -/
  oppCap2_eq : Dsw.packet.oppCap2 = D.packet.oppCap1
  /-- The surplus cap itself is unchanged. -/
  surplusCap_eq : Dsw.packet.surplusCap = D.packet.surplusCap
  /-- The reflected residual has the right-pinned orientation on the swapped
  datum. -/
  pinnedLeft_to_right : ∀ {radius : ℝ} {x : ℝ²},
    D.packet.PinnedLeftSurplusResidualAt radius x →
      Dsw.packet.PinnedRightSurplusResidualAt radius x

/-- The fixed-surplus non-surplus swap preserves the `(m,4,4)` cap-cardinality
predicate, swapping the two non-surplus cap equalities. -/
theorem NonSurplusSwap.isM44_iff {D Dsw : CounterexampleData}
    (hswap : NonSurplusSwap D Dsw) : Dsw.IsM44 ↔ D.IsM44 := by
  constructor
  · intro hM44
    obtain ⟨hcard1, hcard2⟩ := hM44
    refine ⟨?_, ?_⟩
    · rw [← hswap.oppCap2_eq]
      exact hcard2
    · rw [← hswap.oppCap1_eq]
      exact hcard1
  · intro hM44
    obtain ⟨hcard1, hcard2⟩ := hM44
    refine ⟨?_, ?_⟩
    · rw [hswap.oppCap1_eq]
      exact hcard2
    · rw [hswap.oppCap2_eq]
      exact hcard1

/-- A non-surplus swap preserves the minimal-counterexample predicate because
the two data carry the same ambient finite set. -/
theorem NonSurplusSwap.minimal_iff {D Dsw : CounterexampleData}
    (hswap : NonSurplusSwap D Dsw) : Dsw.Minimal ↔ D.Minimal := by
  constructor
  · intro hmin B hBne hBconv hBK4
    rw [← hswap.carrier_eq]
    exact hmin B hBne hBconv hBK4
  · intro hmin B hBne hBconv hBK4
    rw [hswap.carrier_eq]
    exact hmin B hBne hBconv hBK4

/-- The fixed-surplus swap leaves the surplus-cap cardinality unchanged. -/
theorem NonSurplusSwap.surplusCap_card_eq {D Dsw : CounterexampleData}
    (hswap : NonSurplusSwap D Dsw) :
    Dsw.packet.surplusCap.card = D.packet.surplusCap.card :=
  congrArg Finset.card hswap.surplusCap_eq

/-- Construct the fixed-surplus non-surplus swap datum by transposing the two
non-surplus Moser vertices and cap labels, case-by-case on the surplus cap. -/
theorem exists_nonSurplusSwap (D : CounterexampleData) :
    ∃ Dsw : CounterexampleData, NonSurplusSwap D Dsw := by
  rcases hidx : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · let Dsw : CounterexampleData := {
      A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := fixedSurplusSwapPacket0 D hidx }
    refine ⟨Dsw, ?_⟩
    exact {
      carrier_eq := rfl
      oppApex1_eq := by
        simp [Dsw, fixedSurplusSwapPacket0, swap23NonObtuse,
          SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2,
          SurplusCapPacket.triangle, MEC.MoserTriangle.toStructural, hidx]
      oppCap1_eq := by
        simp [Dsw, fixedSurplusSwapPacket0, swap23Partition,
          SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hidx]
      oppCap2_eq := by
        simp [Dsw, fixedSurplusSwapPacket0, swap23Partition,
          SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hidx]
      surplusCap_eq := by
        simp [Dsw, fixedSurplusSwapPacket0, swap23Partition,
          SurplusCapPacket.surplusCap, hidx]
      pinnedLeft_to_right := by
        intro radius x hpinned
        simpa [Dsw] using
          fixedSurplusSwapPacket0_pinnedLeft_to_right D hidx hpinned }
  · let Dsw : CounterexampleData := {
      A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := fixedSurplusSwapPacket1 D hidx }
    refine ⟨Dsw, ?_⟩
    exact {
      carrier_eq := rfl
      oppApex1_eq := by
        simp [Dsw, fixedSurplusSwapPacket1, swap13NonObtuse,
          SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2,
          SurplusCapPacket.triangle, MEC.MoserTriangle.toStructural, hidx]
      oppCap1_eq := by
        simp [Dsw, fixedSurplusSwapPacket1, swap13Partition,
          SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hidx]
      oppCap2_eq := by
        simp [Dsw, fixedSurplusSwapPacket1, swap13Partition,
          SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hidx]
      surplusCap_eq := by
        simp [Dsw, fixedSurplusSwapPacket1, swap13Partition,
          SurplusCapPacket.surplusCap, hidx]
      pinnedLeft_to_right := by
        intro radius x hpinned
        simpa [Dsw] using
          fixedSurplusSwapPacket1_pinnedLeft_to_right D hidx hpinned }
  · let Dsw : CounterexampleData := {
      A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := fixedSurplusSwapPacket2 D hidx }
    refine ⟨Dsw, ?_⟩
    exact {
      carrier_eq := rfl
      oppApex1_eq := by
        simp [Dsw, fixedSurplusSwapPacket2, swap12NonObtuse,
          SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2,
          SurplusCapPacket.triangle, MEC.MoserTriangle.toStructural, hidx]
      oppCap1_eq := by
        simp [Dsw, fixedSurplusSwapPacket2, swap12Partition,
          SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hidx]
      oppCap2_eq := by
        simp [Dsw, fixedSurplusSwapPacket2, swap12Partition,
          SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2, hidx]
      surplusCap_eq := by
        simp [Dsw, fixedSurplusSwapPacket2, swap12Partition,
          SurplusCapPacket.surplusCap, hidx]
      pinnedLeft_to_right := by
        intro radius x hpinned
        simpa [Dsw] using
          fixedSurplusSwapPacket2_pinnedLeft_to_right D hidx hpinned }

/-- No strict adjacent-cap escape at the first non-surplus apex of a
fixed-surplus swapped datum transports to no strict adjacent-cap escape at the
second non-surplus apex of the original datum. -/
theorem noStrictAdjacentEscapeAtOppApex2_of_nonSurplusSwap
    {D Dsw : CounterexampleData} (hswap : NonSurplusSwap D Dsw)
    (hNoEsc : NoStrictAdjacentEscapeAtOppApex1 Dsw) :
    NoStrictAdjacentEscapeAtOppApex2 D := by
  intro hM44 r hr hcard hEsc
  have hM44sw : Dsw.IsM44 := (hswap.isM44_iff).2 hM44
  have hcard' :
      4 ≤ (Dsw.A.filter (fun x => dist x Dsw.packet.oppApex1 = r)).card := by
    simpa [hswap.carrier_eq, hswap.oppApex1_eq] using hcard
  have hEsc' : StrictAdjacentEscapeAtOppApex1 Dsw r := by
    simpa [StrictAdjacentEscapeAtOppApex1, StrictAdjacentEscapeAtOppApex2,
      hswap.carrier_eq, hswap.oppApex1_eq, hswap.oppCap1_eq,
      hswap.oppCap2_eq, hswap.surplusCap_eq, Finset.union_comm] using hEsc
  exact (hNoEsc hM44sw r hr hcard') hEsc'

/-- At the actual K4 radius around the first non-surplus apex, either the two
adjacent Moser endpoints lie on that radius, or the residual is a strict
adjacent-cap escape. -/
theorem oppApex1_endpointRadiusWitness_or_strict_adjacent_escape
    (D : CounterexampleData) :
    D.IsM44 →
      (∃ r : ℝ, 0 < r ∧
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card ∧
        dist D.packet.oppApex2 D.packet.oppApex1 = r ∧
        dist D.packet.surplusApex D.packet.oppApex1 = r) ∨
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card ∧
        StrictAdjacentEscapeAtOppApex1 D r := by
  intro hM44
  obtain ⟨hcard1, _hcard2⟩ := hM44
  have ha_mem : D.packet.oppApex1 ∈ D.A :=
    oppCap2_subset_A D (oppApex1_mem_oppCap2 D)
  obtain ⟨r, hr_pos, hcard_raw⟩ := D.K4 D.packet.oppApex1 ha_mem
  have hcard :
      4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card := by
    simpa [dist_comm] using hcard_raw
  rcases oppApex1_containment_or_strict_adjacent_escape D r hcard with
    hcont | hEsc
  · have hT_eq :
        D.A.filter (fun x => dist x D.packet.oppApex1 = r) =
          D.packet.oppCap1 :=
      Finset.eq_of_subset_of_card_le hcont (by
        rw [hcard1]
        exact hcard)
    have hOtherMem :
        D.packet.oppApex2 ∈
          D.A.filter (fun x => dist x D.packet.oppApex1 = r) := by
      rw [hT_eq]
      exact oppApex2_mem_oppCap1 D
    have hOther :
        dist D.packet.oppApex2 D.packet.oppApex1 = r :=
      (Finset.mem_filter.mp hOtherMem).2
    have hSurpCap1 : D.packet.surplusApex ∈ D.packet.oppCap1 := by
      simpa [surplusApexLocal, SurplusCapPacket.surplusApex] using
        surplusApexLocal_mem_oppCap1 D
    have hSurpMem :
        D.packet.surplusApex ∈
          D.A.filter (fun x => dist x D.packet.oppApex1 = r) := by
      rw [hT_eq]
      exact hSurpCap1
    have hSurp :
        dist D.packet.surplusApex D.packet.oppApex1 = r :=
      (Finset.mem_filter.mp hSurpMem).2
    exact Or.inl ⟨r, hr_pos, hcard, hOther, hSurp⟩
  · exact Or.inr
      ⟨r, hr_pos, hcard,
        by simpa [StrictAdjacentEscapeAtOppApex1] using hEsc⟩

/-- At the actual K4 radius around the second non-surplus apex, either the two
adjacent Moser endpoints lie on that radius, or the residual is a strict
adjacent-cap escape. -/
theorem oppApex2_endpointRadiusWitness_or_strict_adjacent_escape
    (D : CounterexampleData) :
    D.IsM44 →
      (∃ r : ℝ, 0 < r ∧
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card ∧
        dist D.packet.oppApex1 D.packet.oppApex2 = r ∧
        dist D.packet.surplusApex D.packet.oppApex2 = r) ∨
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card ∧
        StrictAdjacentEscapeAtOppApex2 D r := by
  intro hM44
  obtain ⟨_hcard1, hcard2⟩ := hM44
  have ha_mem : D.packet.oppApex2 ∈ D.A :=
    oppCap1_subset_A D (oppApex2_mem_oppCap1 D)
  obtain ⟨r, hr_pos, hcard_raw⟩ := D.K4 D.packet.oppApex2 ha_mem
  have hcard :
      4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card := by
    simpa [dist_comm] using hcard_raw
  rcases oppApex2_containment_or_strict_adjacent_escape D r hcard with
    hcont | hEsc
  · have hT_eq :
        D.A.filter (fun x => dist x D.packet.oppApex2 = r) =
          D.packet.oppCap2 :=
      Finset.eq_of_subset_of_card_le hcont (by
        rw [hcard2]
        exact hcard)
    have hOtherMem :
        D.packet.oppApex1 ∈
          D.A.filter (fun x => dist x D.packet.oppApex2 = r) := by
      rw [hT_eq]
      exact oppApex1_mem_oppCap2 D
    have hOther :
        dist D.packet.oppApex1 D.packet.oppApex2 = r :=
      (Finset.mem_filter.mp hOtherMem).2
    have hSurpCap2 : D.packet.surplusApex ∈ D.packet.oppCap2 := by
      simpa [surplusApexLocal, SurplusCapPacket.surplusApex] using
        surplusApexLocal_mem_oppCap2 D
    have hSurpMem :
        D.packet.surplusApex ∈
          D.A.filter (fun x => dist x D.packet.oppApex2 = r) := by
      rw [hT_eq]
      exact hSurpCap2
    have hSurp :
        dist D.packet.surplusApex D.packet.oppApex2 = r :=
      (Finset.mem_filter.mp hSurpMem).2
    exact Or.inl ⟨r, hr_pos, hcard, hOther, hSurp⟩
  · exact Or.inr
      ⟨r, hr_pos, hcard,
        by simpa [StrictAdjacentEscapeAtOppApex2] using hEsc⟩

/-- If strict adjacent escapes are excluded, the first actual K4 radius supplies
the endpoint-radius hypotheses needed by the endpoint-radius wrapper. -/
theorem oppApex1_endpointRadiusWitness_of_no_strict_adjacent_escape
    (D : CounterexampleData)
    (hNoEsc : NoStrictAdjacentEscapeAtOppApex1 D) :
    D.IsM44 →
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card ∧
        dist D.packet.oppApex2 D.packet.oppApex1 = r ∧
        dist D.packet.surplusApex D.packet.oppApex1 = r := by
  intro hM44
  rcases oppApex1_endpointRadiusWitness_or_strict_adjacent_escape D hM44 with
    hWitness | hEsc
  · exact hWitness
  · obtain ⟨r, hr_pos, hcard, hStrict⟩ := hEsc
    exact False.elim ((hNoEsc hM44 r hr_pos hcard) hStrict)

/-- If strict adjacent escapes are excluded, the second actual K4 radius supplies
the endpoint-radius hypotheses needed by the endpoint-radius wrapper. -/
theorem oppApex2_endpointRadiusWitness_of_no_strict_adjacent_escape
    (D : CounterexampleData)
    (hNoEsc : NoStrictAdjacentEscapeAtOppApex2 D) :
    D.IsM44 →
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card ∧
        dist D.packet.oppApex1 D.packet.oppApex2 = r ∧
        dist D.packet.surplusApex D.packet.oppApex2 = r := by
  intro hM44
  rcases oppApex2_endpointRadiusWitness_or_strict_adjacent_escape D hM44 with
    hWitness | hEsc
  · exact hWitness
  · obtain ⟨r, hr_pos, hcard, hStrict⟩ := hEsc
    exact False.elim ((hNoEsc hM44 r hr_pos hcard) hStrict)

/-- Under the first-apex squeeze hypotheses, cap-containment is equivalent to
identifying the two singleton adjacent-cap hits as points of `oppCap1`. -/
theorem oppApex1_containment_iff_adjacent_hits
    (D : CounterexampleData) (r : ℝ)
    (hM44 : D.IsM44)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card) :
    (D.A.filter (fun x => dist x D.packet.oppApex1 = r) ⊆
        D.packet.oppCap1) ↔
      (∃ s, s ∈ D.A.filter (fun x => dist x D.packet.oppApex1 = r) ∧
          s ∈ D.packet.oppCap1 ∧ s ∈ D.packet.surplusCap) ∧
        (∃ t, t ∈ D.A.filter (fun x => dist x D.packet.oppApex1 = r) ∧
          t ∈ D.packet.oppCap1 ∧ t ∈ D.packet.oppCap2) := by
  let T := D.A.filter (fun x => dist x D.packet.oppApex1 = r)
  constructor
  · intro hcont
    have hsqueeze := oppApex1_squeeze_of_isM44 D r hM44 hK4
    have hSurpCard : (T ∩ D.packet.surplusCap).card = 1 := by
      simpa [T] using hsqueeze.2.2.1
    have hOtherCard : (T ∩ D.packet.oppCap2).card = 1 := by
      simpa [T] using hsqueeze.2.2.2
    have hSurpPos : 0 < (T ∩ D.packet.surplusCap).card := by
      omega
    have hOtherPos : 0 < (T ∩ D.packet.oppCap2).card := by
      omega
    obtain ⟨s, hsInter⟩ := Finset.card_pos.mp hSurpPos
    obtain ⟨t, htInter⟩ := Finset.card_pos.mp hOtherPos
    have hsT : s ∈ T := (Finset.mem_inter.mp hsInter).1
    have hsSurp : s ∈ D.packet.surplusCap :=
      (Finset.mem_inter.mp hsInter).2
    have htT : t ∈ T := (Finset.mem_inter.mp htInter).1
    have htOther : t ∈ D.packet.oppCap2 :=
      (Finset.mem_inter.mp htInter).2
    exact
      ⟨⟨s, by simpa [T] using hsT, hcont hsT, hsSurp⟩,
        ⟨t, by simpa [T] using htT, hcont htT, htOther⟩⟩
  · rintro ⟨hSurpHit, hOtherHit⟩
    exact oppApex1_containment_of_adjacent_hits D r hM44 hK4
      hSurpHit hOtherHit

/-- Under the second-apex squeeze hypotheses, cap-containment is equivalent to
identifying the two singleton adjacent-cap hits as points of `oppCap2`. -/
theorem oppApex2_containment_iff_adjacent_hits
    (D : CounterexampleData) (r : ℝ)
    (hM44 : D.IsM44)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card) :
    (D.A.filter (fun x => dist x D.packet.oppApex2 = r) ⊆
        D.packet.oppCap2) ↔
      (∃ s, s ∈ D.A.filter (fun x => dist x D.packet.oppApex2 = r) ∧
          s ∈ D.packet.oppCap2 ∧ s ∈ D.packet.surplusCap) ∧
        (∃ t, t ∈ D.A.filter (fun x => dist x D.packet.oppApex2 = r) ∧
          t ∈ D.packet.oppCap2 ∧ t ∈ D.packet.oppCap1) := by
  let T := D.A.filter (fun x => dist x D.packet.oppApex2 = r)
  constructor
  · intro hcont
    have hsqueeze := oppApex2_squeeze_of_isM44 D r hM44 hK4
    have hSurpCard : (T ∩ D.packet.surplusCap).card = 1 := by
      simpa [T] using hsqueeze.2.2.1
    have hOtherCard : (T ∩ D.packet.oppCap1).card = 1 := by
      simpa [T] using hsqueeze.2.2.2
    have hSurpPos : 0 < (T ∩ D.packet.surplusCap).card := by
      omega
    have hOtherPos : 0 < (T ∩ D.packet.oppCap1).card := by
      omega
    obtain ⟨s, hsInter⟩ := Finset.card_pos.mp hSurpPos
    obtain ⟨t, htInter⟩ := Finset.card_pos.mp hOtherPos
    have hsT : s ∈ T := (Finset.mem_inter.mp hsInter).1
    have hsSurp : s ∈ D.packet.surplusCap :=
      (Finset.mem_inter.mp hsInter).2
    have htT : t ∈ T := (Finset.mem_inter.mp htInter).1
    have htOther : t ∈ D.packet.oppCap1 :=
      (Finset.mem_inter.mp htInter).2
    exact
      ⟨⟨s, by simpa [T] using hsT, hcont hsT, hsSurp⟩,
        ⟨t, by simpa [T] using htT, hcont htT, htOther⟩⟩
  · rintro ⟨hSurpHit, hOtherHit⟩
    exact oppApex2_containment_of_adjacent_hits D r hM44 hK4
      hSurpHit hOtherHit

end

end U2NonSurplusSqueeze

/-- In the equilateral packet case, the two Moser endpoints of `oppCap1` are
at the same distance from `oppApex1`. -/
theorem oppApex1_endpoint_dist_eq_of_u2Equilateral
    (D : CounterexampleData) (hEq : U2EquilateralMECTriangle D)
    (hM44 : D.IsM44) :
    dist D.packet.surplusApex D.packet.oppApex1 =
      dist D.packet.oppApex2 D.packet.oppApex1 := by
  obtain ⟨h12, h23⟩ := hEq hM44
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusApex, SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi, dist_comm] using h12
  · simpa [SurplusCapPacket.surplusApex, SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi, dist_comm] using h23
  · have h13 : dist D.packet.triangle.v3 D.packet.triangle.v1 =
        dist D.packet.triangle.v1 D.packet.triangle.v2 := by
      calc
        dist D.packet.triangle.v3 D.packet.triangle.v1 =
            dist D.packet.triangle.v2 D.packet.triangle.v3 := h23.symm
        _ = dist D.packet.triangle.v1 D.packet.triangle.v2 := h12.symm
    simpa [SurplusCapPacket.surplusApex, SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi, dist_comm] using h13

/-- In the equilateral packet case, the two Moser endpoints of `oppCap2` are
at the same distance from `oppApex2`. -/
theorem oppApex2_endpoint_dist_eq_of_u2Equilateral
    (D : CounterexampleData) (hEq : U2EquilateralMECTriangle D)
    (hM44 : D.IsM44) :
    dist D.packet.surplusApex D.packet.oppApex2 =
      dist D.packet.oppApex1 D.packet.oppApex2 := by
  obtain ⟨h12, h23⟩ := hEq hM44
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · have h13 : dist D.packet.triangle.v1 D.packet.triangle.v3 =
        dist D.packet.triangle.v2 D.packet.triangle.v3 := by
      calc
        dist D.packet.triangle.v1 D.packet.triangle.v3 =
            dist D.packet.triangle.v3 D.packet.triangle.v1 :=
          dist_comm D.packet.triangle.v1 D.packet.triangle.v3
        _ = dist D.packet.triangle.v2 D.packet.triangle.v3 := h23.symm
    simpa [SurplusCapPacket.surplusApex, SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi, dist_comm] using h13
  · have h12' : dist D.packet.triangle.v1 D.packet.triangle.v2 =
        dist D.packet.triangle.v1 D.packet.triangle.v3 := by
      calc
        dist D.packet.triangle.v1 D.packet.triangle.v2 =
            dist D.packet.triangle.v2 D.packet.triangle.v3 := h12
        _ = dist D.packet.triangle.v3 D.packet.triangle.v1 := h23
        _ = dist D.packet.triangle.v1 D.packet.triangle.v3 :=
          dist_comm D.packet.triangle.v3 D.packet.triangle.v1
    simpa [SurplusCapPacket.surplusApex, SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi, dist_comm] using h12'
  · have h32 : dist D.packet.triangle.v3 D.packet.triangle.v2 =
        dist D.packet.triangle.v1 D.packet.triangle.v2 := by
      calc
        dist D.packet.triangle.v3 D.packet.triangle.v2 =
            dist D.packet.triangle.v2 D.packet.triangle.v3 :=
          dist_comm D.packet.triangle.v3 D.packet.triangle.v2
        _ = dist D.packet.triangle.v1 D.packet.triangle.v2 := h12.symm
    simpa [SurplusCapPacket.surplusApex, SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi, dist_comm] using h32

/-- `U2FullDistanceClasses` from endpoint-radius witnesses at the actual K4
classes selected for the two non-surplus apices.

This is the narrowed packet-wrapper bridge: instead of asking for containment
at every radius, it asks for K4-sized witness classes whose two Moser endpoints
are already on the selected radius. -/
theorem u2FullDistanceClasses_of_endpointRadiusWitnesses
    (D : CounterexampleData)
    (h1 : D.IsM44 →
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card ∧
        dist D.packet.oppApex2 D.packet.oppApex1 = r ∧
        dist D.packet.surplusApex D.packet.oppApex1 = r)
    (h2 : D.IsM44 →
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card ∧
        dist D.packet.oppApex1 D.packet.oppApex2 = r ∧
        dist D.packet.surplusApex D.packet.oppApex2 = r) :
    U2FullDistanceClasses D := by
  intro hM44
  have hM44_for_witnesses : D.IsM44 := hM44
  obtain ⟨hcard1, hcard2⟩ := hM44
  obtain ⟨r1, hr1_pos, hr1_card, h1_other, h1_surplus⟩ :=
    h1 hM44_for_witnesses
  obtain ⟨r2, hr2_pos, hr2_card, h2_other, h2_surplus⟩ :=
    h2 hM44_for_witnesses
  have hT1_sub :
      D.A.filter (fun x => dist x D.packet.oppApex1 = r1) ⊆
        D.packet.oppCap1 :=
    U2NonSurplusSqueeze.oppApex1_filter_subset_oppCap1_of_endpointRadius
      D hr1_pos h1_other h1_surplus
  have hT1_eq :
      D.A.filter (fun x => dist x D.packet.oppApex1 = r1) =
        D.packet.oppCap1 :=
    Finset.eq_of_subset_of_card_le hT1_sub (by
      rw [hcard1]
      exact hr1_card)
  have hT2_sub :
      D.A.filter (fun x => dist x D.packet.oppApex2 = r2) ⊆
        D.packet.oppCap2 :=
    U2NonSurplusSqueeze.oppApex2_filter_subset_oppCap2_of_endpointRadius
      D hr2_pos h2_other h2_surplus
  have hT2_eq :
      D.A.filter (fun x => dist x D.packet.oppApex2 = r2) =
        D.packet.oppCap2 :=
    Finset.eq_of_subset_of_card_le hT2_sub (by
      rw [hcard2]
      exact hr2_card)
  have hrr : r1 = r2 := by
    rw [← h1_other, ← h2_other]
    exact dist_comm D.packet.oppApex2 D.packet.oppApex1
  refine ⟨r1, hr1_pos, hT1_eq, ?_⟩
  have hfilter :
      D.A.filter (fun x => dist x D.packet.oppApex2 = r1) =
        D.A.filter (fun x => dist x D.packet.oppApex2 = r2) := by
    simp [hrr]
  rw [hfilter]
  exact hT2_eq

/-- Equilateral endpoint geometry reduces each surplus-endpoint radius
hypothesis to the corresponding other-endpoint radius hypothesis. -/
theorem u2FullDistanceClasses_of_equilateralEndpointRadiusWitnesses
    (D : CounterexampleData) (hEq : U2EquilateralMECTriangle D)
    (h1 : D.IsM44 →
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card ∧
        dist D.packet.oppApex2 D.packet.oppApex1 = r)
    (h2 : D.IsM44 →
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card ∧
        dist D.packet.oppApex1 D.packet.oppApex2 = r) :
    U2FullDistanceClasses D :=
  u2FullDistanceClasses_of_endpointRadiusWitnesses D
    (fun hM44 => by
      obtain ⟨r, hr_pos, hr_card, hother⟩ := h1 hM44
      exact ⟨r, hr_pos, hr_card, hother,
        (oppApex1_endpoint_dist_eq_of_u2Equilateral D hEq hM44).trans hother⟩)
    (fun hM44 => by
      obtain ⟨r, hr_pos, hr_card, hother⟩ := h2 hM44
      exact ⟨r, hr_pos, hr_card, hother,
        (oppApex2_endpoint_dist_eq_of_u2Equilateral D hEq hM44).trans hother⟩)

/-- Excluding the two strict adjacent-cap escape branches supplies the
endpoint-radius witnesses at the actual K4 radii and hence `U2FullDistanceClasses`.
-/
theorem u2FullDistanceClasses_of_no_strict_adjacent_escape
    (D : CounterexampleData)
    (hNoEsc1 :
      U2NonSurplusSqueeze.NoStrictAdjacentEscapeAtOppApex1 D)
    (hNoEsc2 :
      U2NonSurplusSqueeze.NoStrictAdjacentEscapeAtOppApex2 D) :
    U2FullDistanceClasses D :=
  u2FullDistanceClasses_of_endpointRadiusWitnesses D
    (U2NonSurplusSqueeze.oppApex1_endpointRadiusWitness_of_no_strict_adjacent_escape
      D hNoEsc1)
    (U2NonSurplusSqueeze.oppApex2_endpointRadiusWitness_of_no_strict_adjacent_escape
      D hNoEsc2)

/-- U1 endpoint-equality supplies the cap-containment input needed for U2.B. -/
theorem u2FullDistanceClasses_of_u1EndpointEquality
    (D : CounterexampleData) (hEE : U1EndpointEquality D) :
    U2FullDistanceClasses D :=
  u2FullDistanceClasses_of_endpointRadiusWitnesses D
    (U2NonSurplusSqueeze.oppApex1_endpointRadiusWitness_of_u1EndpointEquality
      D hEE)
    (U2NonSurplusSqueeze.oppApex2_endpointRadiusWitness_of_u1EndpointEquality
      D hEE)

/-- U1 endpoint-equality is sufficient for the full U2 package through the
non-surplus squeeze and the unconditional Apollonius-arc theorem. -/
theorem u2Statement_of_u1EndpointEquality
    (D : CounterexampleData) (hEE : U1EndpointEquality D) :
    U2Statement D :=
  u2Statement_of_u2FullDistanceClasses D
    (u2FullDistanceClasses_of_u1EndpointEquality D hEE)

end Problem97
