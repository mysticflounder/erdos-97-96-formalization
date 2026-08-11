/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedGeometry
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Zero-cut boundary indexing for a Moser cap packet

This extracts the cardinality-independent boundary construction used by the
frontier arguments.  Cutting the carrier boundary at the surplus apex places
the three strict cap interiors in the canonical direct or reflected blocks.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace ZeroCutBoundaryIndexing

open CapSelectedGeometry
open GeneralCarrierBridge

/-- Package a supplied injective CCW enumeration with the inverse indexing
needed by `BoundaryIndexing`.  This is the retained-boundary counterpart of
`GeneralCarrierBridge.exists_boundaryIndexing`: callers that have already
chosen a useful cyclic cut do not lose it to a fresh existential choice. -/
noncomputable def boundaryIndexingOfBoundary
    {A : Finset ℝ²} {n : ℕ} (boundary : Fin n → ℝ²)
    (hinjective : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary) :
    BoundaryIndexing A := by
  classical
  have hex (label : CarrierLabel A) :
      ∃ i : Fin n, boundary i = label.1 := by
    have hmem : label.1 ∈ Finset.univ.image boundary := by
      rw [himage]
      exact label.2
    rcases Finset.mem_image.mp hmem with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩
  let indexOf : CarrierLabel A → Fin n :=
    fun label => Classical.choose (hex label)
  have hpoint : ∀ label, boundary (indexOf label) = pointOf label :=
    fun label => Classical.choose_spec (hex label)
  have hindexInj : Function.Injective indexOf := by
    intro a b hab
    apply Subtype.ext
    calc
      a.1 = boundary (indexOf a) := (hpoint a).symm
      _ = boundary (indexOf b) := congrArg boundary hab
      _ = b.1 := hpoint b
  exact
    { n := n
      boundary := boundary
      indexOf := indexOf
      boundary_injective := hinjective
      boundary_image := himage
      boundary_ccw := hccw
      index_injective := hindexInj
      point_eq := hpoint }

/-- Any retained CCW boundary indexing cut at the surplus apex carries the
three canonical cap blocks.  Unlike `exists_with_capBlocks`, this theorem does
not choose a fresh boundary: consumers may supply an indexing that already
retains local ordered-cap data. -/
theorem capBlocks_of_zeroCutBoundary
    {A : Finset ℝ²} (S : SurplusCapPacket A) (B : BoundaryIndexing A)
    (hn : 0 < B.n)
    (hzero : B.boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx) :
    ∃ iv iw : Fin B.n,
      B.boundary iv = S.oppositeVertexByIndex S.oppIndex1 ∧
      B.boundary iw = S.oppositeVertexByIndex S.oppIndex2 ∧
      (DirectBoundaryBlocks S B.boundary hn iv iw ∨
        MirrorBoundaryBlocks S B.boundary hn iv iw) := by
  classical
  have hvImage :
      S.oppositeVertexByIndex S.oppIndex1 ∈
        Finset.univ.image B.boundary := by
    rw [B.boundary_image]
    exact S.oppositeVertexByIndex_mem S.oppIndex1
  have hwImage :
      S.oppositeVertexByIndex S.oppIndex2 ∈
        Finset.univ.image B.boundary := by
    rw [B.boundary_image]
    exact S.oppositeVertexByIndex_mem S.oppIndex2
  rcases Finset.mem_image.mp hvImage with ⟨iv, _hiv, hv⟩
  rcases Finset.mem_image.mp hwImage with ⟨iw, _hiw, hw⟩
  have huv : S.oppositeVertexByIndex S.surplusIdx ≠
      S.oppositeVertexByIndex S.oppIndex1 :=
    S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex1
  have huw : S.oppositeVertexByIndex S.surplusIdx ≠
      S.oppositeVertexByIndex S.oppIndex2 :=
    S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex2
  have hvw : S.oppositeVertexByIndex S.oppIndex1 ≠
      S.oppositeVertexByIndex S.oppIndex2 :=
    S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2
  have horder :=
    _root_.Problem97.image_index_order_dichotomy_after_zero hn
      (φ := B.boundary) hzero hv hw huv huw hvw
  have huSurplusV1 :
      B.boundary (zeroIndex hn) =
        (S.triangleByIndex S.surplusIdx).v1 :=
    hzero.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx).symm
  have hvSurplusV2 :
      B.boundary iv = (S.triangleByIndex S.surplusIdx).v2 :=
    hv.trans
      S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm
  have hwSurplusV3 :
      B.boundary iw = (S.triangleByIndex S.surplusIdx).v3 :=
    hw.trans
      S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm
  have hvOpp1V1 :
      B.boundary iv = (S.triangleByIndex S.oppIndex1).v1 :=
    hv.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex1).symm
  have hwOpp1V2 :
      B.boundary iw = (S.triangleByIndex S.oppIndex1).v2 :=
    hw.trans
      S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm
  have huOpp1V3 :
      B.boundary (zeroIndex hn) =
        (S.triangleByIndex S.oppIndex1).v3 :=
    hzero.trans
      S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  have hwOpp2V1 :
      B.boundary iw = (S.triangleByIndex S.oppIndex2).v1 :=
    hw.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm
  have huOpp2V2 :
      B.boundary (zeroIndex hn) =
        (S.triangleByIndex S.oppIndex2).v2 :=
    hzero.trans
      S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm
  have hvOpp2V3 :
      B.boundary iv = (S.triangleByIndex S.oppIndex2).v3 :=
    hv.trans
      S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm
  refine ⟨iv, iw, hv, hw, ?_⟩
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
        S.oppIndex2 B.boundary_ccw B.boundary_injective B.boundary_image
        hdirect.1 (Or.inr hdirect.2) hwOpp2V1 huOpp2V2 hvOpp2V3 hx
    · intro x hx
      exact S.capInteriorByIndex_open_interval_of_global_indices
        S.surplusIdx B.boundary_ccw B.boundary_injective B.boundary_image
        hdirect.2 (Or.inl hdirect.1) huSurplusV1 hvSurplusV2
        hwSurplusV3 hx
    · intro x hx
      change x ∈ S.capInteriorByIndex S.oppIndex1 at hx
      rcases S.capInteriorByIndex_open_reverse_complement_interval_of_global_indices
          S.oppIndex1 B.boundary_ccw B.boundary_injective B.boundary_image
          hdirect.1 hdirect.2 hvOpp1V1 hwOpp1V2 huOpp1V3 hx with
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
        S.oppIndex1 B.boundary_ccw B.boundary_injective B.boundary_image
        hmirror.1 (Or.inr hmirror.2) hvOpp1V1 hwOpp1V2 huOpp1V3 hx
    · intro x hx
      exact S.capInteriorByIndex_open_reverse_interval_of_global_indices
        S.surplusIdx B.boundary_ccw B.boundary_injective B.boundary_image
        hmirror.2 (Or.inl hmirror.1) huSurplusV1 hvSurplusV2
        hwSurplusV3 hx
    · intro x hx
      change x ∈ S.capInteriorByIndex S.oppIndex2 at hx
      rcases S.capInteriorByIndex_open_complement_interval_of_global_indices
          S.oppIndex2 B.boundary_ccw B.boundary_injective B.boundary_image
          hmirror.1 hmirror.2 hwOpp2V1 huOpp2V2 hvOpp2V3 hx with
        ⟨q, hq | hq, hqx⟩
      · have hnot : ¬ q < zeroIndex hn := by
          apply not_lt_of_ge
          change 0 ≤ q.val
          omega
        exact (hnot hq).elim
      · exact ⟨q, hq, hqx⟩

/-- A zero-cut boundary indexing whose three strict Moser-cap interiors occur
in the canonical direct or mirror blocks.  This uses no exact-cardinality or
`SurplusCapPacket.IsM44` hypothesis. -/
theorem exists_with_capBlocks
    {D : CounterexampleData} (S : SurplusCapPacket D.A) :
    ∃ (B : BoundaryIndexing D.A) (hn : 0 < B.n)
        (iv iw : Fin B.n),
      B.boundary (zeroIndex hn) =
          S.oppositeVertexByIndex S.surplusIdx ∧
      B.boundary iv = S.oppositeVertexByIndex S.oppIndex1 ∧
      B.boundary iw = S.oppositeVertexByIndex S.oppIndex2 ∧
      (DirectBoundaryBlocks S B.boundary hn iv iw ∨
        MirrorBoundaryBlocks S B.boundary hn iv iw) := by
  classical
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      D.nonempty D.convex D.K4 with
    ⟨n, hn, boundary, iv, iw, hboundary, hboundaryImage, hccw,
      hu, hv, hw, horder⟩
  have hex (label : CarrierLabel D.A) :
      ∃ i : Fin n, boundary i = label.1 := by
    have hmem : label.1 ∈ Finset.univ.image boundary := by
      rw [hboundaryImage]
      exact label.2
    rcases Finset.mem_image.mp hmem with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩
  let indexOf : CarrierLabel D.A → Fin n :=
    fun label => Classical.choose (hex label)
  have hpoint : ∀ label, boundary (indexOf label) = pointOf label :=
    fun label => Classical.choose_spec (hex label)
  have hindexInj : Function.Injective indexOf := by
    intro a b hab
    apply Subtype.ext
    calc
      a.1 = boundary (indexOf a) := (hpoint a).symm
      _ = boundary (indexOf b) := congrArg boundary hab
      _ = b.1 := hpoint b
  let B : BoundaryIndexing D.A :=
    { n := n
      boundary := boundary
      indexOf := indexOf
      boundary_injective := hboundary
      boundary_image := hboundaryImage
      boundary_ccw := hccw
      index_injective := hindexInj
      point_eq := hpoint }
  have hu' : boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx := by
    simpa [zeroIndex] using hu
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
      boundary (zeroIndex hn) = (S.triangleByIndex S.oppIndex1).v3 :=
    hu'.trans
      S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  have hwOpp2V1 :
      boundary iw = (S.triangleByIndex S.oppIndex2).v1 :=
    hw.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm
  have huOpp2V2 :
      boundary (zeroIndex hn) = (S.triangleByIndex S.oppIndex2).v2 :=
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
  exact ⟨B, hn, iv, iw, hu', hv, hw, horientation⟩

end ZeroCutBoundaryIndexing
end Census554
end Problem97
