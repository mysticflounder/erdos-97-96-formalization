/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedFiniteCode
import Erdos9796Proof.P97.Census554.SeparationMirror
import Erdos9796Proof.P97.SurplusM44Packet

/-!
# Geometric labeling surface for the cap-selected card-eleven branch

The forced `(6,4,4)` branch uses a different block profile from the existing
card-eleven `(5,5,4)` separation certificate. This file records only the common
boundary contract: canonical labels occur in the order encoded by
`CapSelectedFiniteCode.hullIndex`, or in its reflection about the surplus-apex
cut.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace CapSelectedGeometry

open CapSelectedFiniteCode
open SeparationCore

/-- A CCW boundary realizing the canonical `(6,4,4)` labels in either
orientation. -/
structure CanonicalHull (pointOf : Label -> ℝ²) where
  boundary : Label -> ℝ²
  boundary_injective : Function.Injective boundary
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  point_eq :
    (∀ label, boundary (hullIndex label) = pointOf label) ∨
    (∀ label, boundary (card11BoundaryReflection (hullIndex label)) =
      pointOf label)

theorem hullIndex_injective : Function.Injective hullIndex := by
  intro left right h
  fin_cases left <;> fin_cases right <;> simp_all [hullIndex]

theorem CanonicalHull.point_eq_direct_or_mirror
    {pointOf : Label -> ℝ²} (H : CanonicalHull pointOf) :
    (∀ label, H.boundary (hullIndex label) = pointOf label) ∨
    (∀ label, H.boundary (card11BoundaryReflection (hullIndex label)) =
      pointOf label) :=
  H.point_eq

/-- Index zero in a nonempty ambient boundary enumeration. -/
def zeroIndex {n : Nat} (hn : 0 < n) : Fin n :=
  ⟨0, hn⟩

/-- The three strict-interior blocks in the direct zero-cut order
`U, O2, V, S, W, O1`. -/
structure DirectBoundaryBlocks {A : Finset ℝ²} (S : SurplusCapPacket A)
    {n : Nat} (boundary : Fin n -> ℝ²) (hn : 0 < n)
    (iv iw : Fin n) : Prop where
  apex_order : zeroIndex hn < iv ∧ iv < iw
  opp2_between :
    ∀ x ∈ S.oppInterior2,
      ∃ q : Fin n, zeroIndex hn < q ∧ q < iv ∧ boundary q = x
  surplus_between :
    ∀ x ∈ S.capInteriorByIndex S.surplusIdx,
      ∃ q : Fin n, iv < q ∧ q < iw ∧ boundary q = x
  opp1_after :
    ∀ x ∈ S.oppInterior1,
      ∃ q : Fin n, iw < q ∧ boundary q = x

/-- The three strict-interior blocks in the reflected zero-cut order
`U, O1, W, S, V, O2`. -/
structure MirrorBoundaryBlocks {A : Finset ℝ²} (S : SurplusCapPacket A)
    {n : Nat} (boundary : Fin n -> ℝ²) (hn : 0 < n)
    (iv iw : Fin n) : Prop where
  apex_order : zeroIndex hn < iw ∧ iw < iv
  opp1_between :
    ∀ x ∈ S.oppInterior1,
      ∃ q : Fin n, zeroIndex hn < q ∧ q < iw ∧ boundary q = x
  surplus_between :
    ∀ x ∈ S.capInteriorByIndex S.surplusIdx,
      ∃ q : Fin n, iw < q ∧ q < iv ∧ boundary q = x
  opp2_after :
    ∀ x ∈ S.oppInterior2,
      ∃ q : Fin n, iv < q ∧ boundary q = x

/-- A common CCW boundary for the forced card-eleven branch, with exact
strict-interior cardinalities and all three cap blocks located in the direct
or reflected zero-cut order. -/
structure BoundaryBlocks {A : Finset ℝ²} (S : SurplusCapPacket A) where
  n : Nat
  hn : 0 < n
  boundary : Fin n -> ℝ²
  opp1Index : Fin n
  opp2Index : Fin n
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  zero_eq :
    boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx
  opp1_eq :
    boundary opp1Index =
      S.oppositeVertexByIndex S.oppIndex1
  opp2_eq :
    boundary opp2Index =
      S.oppositeVertexByIndex S.oppIndex2
  carrier_card : A.card = 11
  surplusInterior_card :
    (S.capInteriorByIndex S.surplusIdx).card = 4
  oppInterior1_card : S.oppInterior1.card = 2
  oppInterior2_card : S.oppInterior2.card = 2
  orientation :
    DirectBoundaryBlocks S boundary hn opp1Index opp2Index ∨
      MirrorBoundaryBlocks S boundary hn opp1Index opp2Index

/-- The ambient boundary enumeration in a card-eleven block packet itself has
eleven indices. -/
theorem BoundaryBlocks.n_eq_eleven
    {A : Finset ℝ²} {S : SurplusCapPacket A} (B : BoundaryBlocks S) :
    B.n = 11 := by
  have hcard := congrArg Finset.card B.boundary_image
  rw [Finset.card_image_of_injective _ B.boundary_injective,
    Finset.card_univ, Fintype.card_fin, B.carrier_card] at hcard
  exact hcard

private theorem capInteriorByIndex_card_eq_four_of_cap_card_eq_six
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hcard : (S.capByIndex i).card = 6) :
    (S.capInteriorByIndex i).card = 4 := by
  fin_cases i
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv3 :
        S.triangle.v3 ∈ S.partition.C1.erase S.triangle.v2 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v23_ne.symm, S.partition.v3_mem_C1⟩
    rw [Finset.card_erase_of_mem hv3,
      Finset.card_erase_of_mem S.partition.v2_mem_C1, hcard]
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv1 :
        S.triangle.v1 ∈ S.partition.C2.erase S.triangle.v3 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v13_ne, S.partition.v1_mem_C2⟩
    rw [Finset.card_erase_of_mem hv1,
      Finset.card_erase_of_mem S.partition.v3_mem_C2, hcard]
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv2 :
        S.triangle.v2 ∈ S.partition.C3.erase S.triangle.v1 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v12_ne.symm, S.partition.v2_mem_C3⟩
    rw [Finset.card_erase_of_mem hv2,
      Finset.card_erase_of_mem S.partition.v1_mem_C3, hcard]

/-- The `(6,4,4)` equality case has a common zero-cut boundary whose strict
interiors form exact blocks of sizes `(4,2,2)` in one of the two canonical
orientations. -/
theorem exists_boundaryBlocks_of_isM44_surplus_card_eq_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hsurplusCard : S.surplusCap.card = 6) :
    Nonempty (BoundaryBlocks S) := by
  classical
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      hne hconv hK4 with
    ⟨n, hn, boundary, iv, iw, hboundary, hboundaryImage, hccw,
      hu, hv, hw, horder⟩
  have hu' :
      boundary (zeroIndex hn) =
        S.oppositeVertexByIndex S.surplusIdx := by
    simpa [zeroIndex] using hu
  have hsurplusCapByIndex :
      (S.capByIndex S.surplusIdx).card = 6 := by
    rcases hi : S.surplusIdx with ⟨idx, hidx⟩
    interval_cases idx <;>
      simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.capByIndex, hi] using hsurplusCard
  have hsurplusInteriorCard :
      (S.capInteriorByIndex S.surplusIdx).card = 4 :=
    capInteriorByIndex_card_eq_four_of_cap_card_eq_six
      S S.surplusIdx hsurplusCapByIndex
  have hoppInterior1Card : S.oppInterior1.card = 2 := by
    simpa [SurplusCapPacket.oppInterior1] using
      S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four S.oppIndex1
        hM44.oppIndex1_cap_card_eq_four
  have hoppInterior2Card : S.oppInterior2.card = 2 := by
    simpa [SurplusCapPacket.oppInterior2] using
      S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four S.oppIndex2
        hM44.oppIndex2_cap_card_eq_four
  have hcarrierCard : A.card = 11 := by
    have hsum := hM44.surplus_card_eq
    omega
  have huSurplusV1 :
      boundary (zeroIndex hn) =
        (S.triangleByIndex S.surplusIdx).v1 :=
    hu'.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx).symm
  have hvSurplusV2 :
      boundary iv = (S.triangleByIndex S.surplusIdx).v2 :=
    hv.trans
      S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm
  have hwSurplusV3 :
      boundary iw = (S.triangleByIndex S.surplusIdx).v3 :=
    hw.trans
      S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm
  have hvOpp1V1 :
      boundary iv = (S.triangleByIndex S.oppIndex1).v1 :=
    hv.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex1).symm
  have hwOpp1V2 :
      boundary iw = (S.triangleByIndex S.oppIndex1).v2 :=
    hw.trans
      S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm
  have huOpp1V3 :
      boundary (zeroIndex hn) =
        (S.triangleByIndex S.oppIndex1).v3 :=
    hu'.trans
      S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  have hwOpp2V1 :
      boundary iw = (S.triangleByIndex S.oppIndex2).v1 :=
    hw.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm
  have huOpp2V2 :
      boundary (zeroIndex hn) =
        (S.triangleByIndex S.oppIndex2).v2 :=
    hu'.trans
      S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm
  have hvOpp2V3 :
      boundary iv = (S.triangleByIndex S.oppIndex2).v3 :=
    hv.trans
      S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm
  have horientation :
      DirectBoundaryBlocks S boundary hn iv iw ∨
        MirrorBoundaryBlocks S boundary hn iv iw := by
    rcases horder with hdirect | hmirror
    · left
      refine
        { apex_order := hdirect
          opp2_between := ?_
          surplus_between := ?_
          opp1_after := ?_ }
      · intro x hx
        change x ∈ S.capInteriorByIndex S.oppIndex2 at hx
        exact S.capInteriorByIndex_open_interval_of_global_indices
          S.oppIndex2 hccw hboundary hboundaryImage hdirect.1
          (Or.inr hdirect.2) hwOpp2V1 huOpp2V2 hvOpp2V3 hx
      · intro x hx
        exact S.capInteriorByIndex_open_interval_of_global_indices
          S.surplusIdx hccw hboundary hboundaryImage hdirect.2
          (Or.inl hdirect.1) huSurplusV1 hvSurplusV2 hwSurplusV3 hx
      · intro x hx
        change x ∈ S.capInteriorByIndex S.oppIndex1 at hx
        rcases S.capInteriorByIndex_open_reverse_complement_interval_of_global_indices
            S.oppIndex1 hccw hboundary hboundaryImage hdirect.1
            hdirect.2 hvOpp1V1 hwOpp1V2 huOpp1V3 hx with
          ⟨q, hq | hq, hqx⟩
        · have hnot : ¬ q < zeroIndex hn := by
            apply not_lt_of_ge
            change 0 ≤ q.val
            omega
          exact (hnot hq).elim
        · exact ⟨q, hq, hqx⟩
    · right
      refine
        { apex_order := hmirror
          opp1_between := ?_
          surplus_between := ?_
          opp2_after := ?_ }
      · intro x hx
        change x ∈ S.capInteriorByIndex S.oppIndex1 at hx
        exact S.capInteriorByIndex_open_reverse_interval_of_global_indices
          S.oppIndex1 hccw hboundary hboundaryImage hmirror.1
          (Or.inr hmirror.2) hvOpp1V1 hwOpp1V2 huOpp1V3 hx
      · intro x hx
        exact S.capInteriorByIndex_open_reverse_interval_of_global_indices
          S.surplusIdx hccw hboundary hboundaryImage hmirror.2
          (Or.inl hmirror.1) huSurplusV1 hvSurplusV2 hwSurplusV3 hx
      · intro x hx
        change x ∈ S.capInteriorByIndex S.oppIndex2 at hx
        rcases S.capInteriorByIndex_open_complement_interval_of_global_indices
            S.oppIndex2 hccw hboundary hboundaryImage hmirror.1
            hmirror.2 hwOpp2V1 huOpp2V2 hvOpp2V3 hx with
          ⟨q, hq | hq, hqx⟩
        · have hnot : ¬ q < zeroIndex hn := by
            apply not_lt_of_ge
            change 0 ≤ q.val
            omega
          exact (hnot hq).elim
        · exact ⟨q, hq, hqx⟩
  exact
    ⟨{
      n := n
      hn := hn
      boundary := boundary
      opp1Index := iv
      opp2Index := iw
      boundary_injective := hboundary
      boundary_image := hboundaryImage
      boundary_ccw := hccw
      zero_eq := hu'
      opp1_eq := hv
      opp2_eq := hw
      carrier_card := hcarrierCard
      surplusInterior_card := hsurplusInteriorCard
      oppInterior1_card := hoppInterior1Card
      oppInterior2_card := hoppInterior2Card
      orientation := horientation }⟩

end CapSelectedGeometry
end Census554
end Problem97
