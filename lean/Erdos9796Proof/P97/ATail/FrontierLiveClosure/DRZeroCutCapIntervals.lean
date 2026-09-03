/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFourAdjacentGridKalmanson
import Erdos9796Proof.P97.Census554.ZeroCutBoundaryIndexing

/-!
# Closed-cap intervals for a zero-cut boundary

The zero-cut block predicates identify where each strict cap interior occurs.
The `Shard01` cap-interval theorems upgrade those one-sided interior facts to
closed-cap interval characterizations, including the wrapping caps.  This is
the exact interval contract required by a retained-boundary `CGN4g` package.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge
open Census554.ZeroCutBoundaryIndexing

/-- Closed-cap intervals in the direct zero-cut orientation. -/
structure DirectCapIntervals {A : Finset ℝ²} (S : SurplusCapPacket A)
    {n : ℕ} (boundary : Fin n → ℝ²) (hn : 0 < n) (iv iw : Fin n) : Prop where
  surplus : ∀ x : ℝ², x ∈ S.capByIndex S.surplusIdx ↔
    ∃ q : Fin n, iv ≤ q ∧ q ≤ iw ∧ boundary q = x
  first : ∀ x : ℝ², x ∈ S.capByIndex S.oppIndex1 ↔
    ∃ q : Fin n, (q ≤ zeroIndex hn ∨ iw ≤ q) ∧ boundary q = x
  second : ∀ x : ℝ², x ∈ S.capByIndex S.oppIndex2 ↔
    ∃ q : Fin n, zeroIndex hn ≤ q ∧ q ≤ iv ∧ boundary q = x

/-- Closed-cap intervals in the reflected zero-cut orientation. -/
structure MirrorCapIntervals {A : Finset ℝ²} (S : SurplusCapPacket A)
    {n : ℕ} (boundary : Fin n → ℝ²) (hn : 0 < n) (iv iw : Fin n) : Prop where
  surplus : ∀ x : ℝ², x ∈ S.capByIndex S.surplusIdx ↔
    ∃ q : Fin n, iw ≤ q ∧ q ≤ iv ∧ boundary q = x
  first : ∀ x : ℝ², x ∈ S.capByIndex S.oppIndex1 ↔
    ∃ q : Fin n, zeroIndex hn ≤ q ∧ q ≤ iw ∧ boundary q = x
  second : ∀ x : ℝ², x ∈ S.capByIndex S.oppIndex2 ↔
    ∃ q : Fin n, (q ≤ zeroIndex hn ∨ iv ≤ q) ∧ boundary q = x

/-- The direct or reflected zero-cut blocks imply exact closed-cap intervals. -/
theorem capByIndex_intervals_of_zeroCutBlocks
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (B : BoundaryIndexing A) (hn : 0 < B.n) (iv iw : Fin B.n)
    (hzero : B.boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hiv : B.boundary iv = S.oppositeVertexByIndex S.oppIndex1)
    (hiw : B.boundary iw = S.oppositeVertexByIndex S.oppIndex2)
    (hblocks : DirectBoundaryBlocks S B.boundary hn iv iw ∨
      MirrorBoundaryBlocks S B.boundary hn iv iw) :
    (DirectBoundaryBlocks S B.boundary hn iv iw ∧
      DirectCapIntervals S B.boundary hn iv iw) ∨
    (MirrorBoundaryBlocks S B.boundary hn iv iw ∧
      MirrorCapIntervals S B.boundary hn iv iw) := by
  have hzero_surplus : B.boundary (zeroIndex hn) =
      (S.triangleByIndex S.surplusIdx).v1 :=
    hzero.trans (S.triangleByIndex_v1_eq_oppositeVertexByIndex
      S.surplusIdx).symm
  have hiv_surplus : B.boundary iv =
      (S.triangleByIndex S.surplusIdx).v2 :=
    hiv.trans S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm
  have hiw_surplus : B.boundary iw =
      (S.triangleByIndex S.surplusIdx).v3 :=
    hiw.trans S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm
  have hiv_first : B.boundary iv =
      (S.triangleByIndex S.oppIndex1).v1 :=
    hiv.trans (S.triangleByIndex_v1_eq_oppositeVertexByIndex
      S.oppIndex1).symm
  have hiw_first : B.boundary iw =
      (S.triangleByIndex S.oppIndex1).v2 :=
    hiw.trans S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm
  have hzero_first : B.boundary (zeroIndex hn) =
      (S.triangleByIndex S.oppIndex1).v3 :=
    hzero.trans S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  have hiw_second : B.boundary iw =
      (S.triangleByIndex S.oppIndex2).v1 :=
    hiw.trans (S.triangleByIndex_v1_eq_oppositeVertexByIndex
      S.oppIndex2).symm
  have hzero_second : B.boundary (zeroIndex hn) =
      (S.triangleByIndex S.oppIndex2).v2 :=
    hzero.trans S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm
  have hiv_second : B.boundary iv =
      (S.triangleByIndex S.oppIndex2).v3 :=
    hiv.trans S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm
  rcases hblocks with hdirect | hmirror
  · left
    refine ⟨hdirect, ?_⟩
    refine
      { surplus := S.capByIndex_interval_of_global_indices S.surplusIdx
          B.boundary_ccw B.boundary_injective B.boundary_image
          hdirect.apex_order.2 (Or.inl hdirect.apex_order.1)
          hzero_surplus hiv_surplus hiw_surplus
        first := S.capByIndex_reverse_complement_interval_of_global_indices
          S.oppIndex1 B.boundary_ccw B.boundary_injective B.boundary_image
          hdirect.apex_order.1 hdirect.apex_order.2
          hiv_first hiw_first hzero_first
        second := S.capByIndex_interval_of_global_indices S.oppIndex2
          B.boundary_ccw B.boundary_injective B.boundary_image
          hdirect.apex_order.1
          (Or.inr hdirect.apex_order.2)
          hiw_second hzero_second hiv_second }
  · right
    refine ⟨hmirror, ?_⟩
    refine
      { surplus := S.capByIndex_reverse_interval_of_global_indices S.surplusIdx
          B.boundary_ccw B.boundary_injective B.boundary_image
          hmirror.apex_order.2 (Or.inl hmirror.apex_order.1)
          hzero_surplus hiv_surplus hiw_surplus
        first := S.capByIndex_reverse_interval_of_global_indices S.oppIndex1
          B.boundary_ccw B.boundary_injective B.boundary_image
          hmirror.apex_order.1 (Or.inr hmirror.apex_order.2)
          hiv_first hiw_first hzero_first
        second := S.capByIndex_complement_interval_of_global_indices S.oppIndex2
          B.boundary_ccw B.boundary_injective B.boundary_image
          hmirror.apex_order.1
          hmirror.apex_order.2 hiw_second hzero_second hiv_second }

/-- Retain the two caps whose zero-cut description is a linear interval.

The remaining cap is a wrapping complement in each orientation, so it cannot
be passed to `strictCapBlockData_of_supportCap_on_boundary` with the original
linear order.  A cyclic recut is required for that cap.  This theorem keeps
the two directly usable `StrictCapBlockData` values on the common boundary
`B.boundary` and records the orientation in the result.
-/
theorem retained_nonwrapping_capBlocks_of_zeroCutBlocks
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (B : BoundaryIndexing D.A) (hn : 0 < B.n) (iv iw : Fin B.n)
    (hzero : B.boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hiv : B.boundary iv = S.oppositeVertexByIndex S.oppIndex1)
    (hiw : B.boundary iw = S.oppositeVertexByIndex S.oppIndex2)
    (hblocks : DirectBoundaryBlocks S B.boundary hn iv iw ∨
      MirrorBoundaryBlocks S B.boundary hn iv iw) :
    (∃ (BS : CGN.StrictCapBlockData D.A (S.capByIndex S.surplusIdx))
        (B2 : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)),
        BS.n = B.n ∧ HEq BS.phi B.boundary ∧
          B2.n = B.n ∧ HEq B2.phi B.boundary) ∨
    (∃ (BS : CGN.StrictCapBlockData D.A (S.capByIndex S.surplusIdx))
        (B1 : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex1)),
        BS.n = B.n ∧ HEq BS.phi B.boundary ∧
          B1.n = B.n ∧ HEq B1.phi B.boundary) := by
  classical
  have hzero_surplus : B.boundary (zeroIndex hn) =
      (S.triangleByIndex S.surplusIdx).v1 :=
    hzero.trans (S.triangleByIndex_v1_eq_oppositeVertexByIndex
      S.surplusIdx).symm
  have hiv_surplus : B.boundary iv =
      (S.triangleByIndex S.surplusIdx).v2 :=
    hiv.trans S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm
  have hiw_surplus : B.boundary iw =
      (S.triangleByIndex S.surplusIdx).v3 :=
    hiw.trans S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm
  have hiv_first : B.boundary iv =
      (S.triangleByIndex S.oppIndex1).v1 :=
    hiv.trans (S.triangleByIndex_v1_eq_oppositeVertexByIndex
      S.oppIndex1).symm
  have hiw_first : B.boundary iw =
      (S.triangleByIndex S.oppIndex1).v2 :=
    hiw.trans S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm
  have hzero_first : B.boundary (zeroIndex hn) =
      (S.triangleByIndex S.oppIndex1).v3 :=
    hzero.trans S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  have hiw_second : B.boundary iw =
      (S.triangleByIndex S.oppIndex2).v1 :=
    hiw.trans (S.triangleByIndex_v1_eq_oppositeVertexByIndex
      S.oppIndex2).symm
  have hzero_second : B.boundary (zeroIndex hn) =
      (S.triangleByIndex S.oppIndex2).v2 :=
    hzero.trans S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm
  have hiv_second : B.boundary iv =
      (S.triangleByIndex S.oppIndex2).v3 :=
    hiv.trans S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm
  have hneg : ∀ {i j k : Fin B.n}, i < j → j < k →
      Problem97.signedArea2 (B.boundary i) (B.boundary j) (B.boundary k) < 0 := by
    intro i j k hij hjk
    exact ExactFourAdjacentGridKalmanson.signedArea_strict_of_boundaryIndexing B hij hjk
  have hcycle {a b c : ℝ²} :
      Problem97.signedArea2 a b c = Problem97.signedArea2 b c a := by
    simp [Problem97.signedArea2]
    ring
  have mkData {i : Fin 3} {u lo hi : Fin B.n}
      (hlohi : lo < hi)
      (hinterval : ∀ x : ℝ², x ∈ S.capByIndex i ↔
        ∃ q : Fin B.n, lo ≤ q ∧ q ≤ hi ∧ B.boundary q = x)
      (hu : B.boundary u = (S.triangleByIndex i).v1)
      (hends : ((B.boundary lo = (S.triangleByIndex i).v2 ∧
          B.boundary hi = (S.triangleByIndex i).v3) ∨
        (B.boundary lo = (S.triangleByIndex i).v3 ∧
          B.boundary hi = (S.triangleByIndex i).v2)))
      (hbase : Problem97.signedArea2 (B.boundary u) (B.boundary lo)
        (B.boundary hi) < 0) :
      ∃ data : CGN.StrictCapBlockData D.A (S.capByIndex i),
        data.n = B.n ∧ HEq data.phi B.boundary := by
    obtain ⟨m, L, Packet, Hside, Block, Hord, _, _⟩ :=
      ExactFourAdjacentGridKalmanson.strictCapBlockData_of_supportCap_on_boundary
        D.convex (S.capByIndex_subset i) (S.circPacketByIndex i)
        (S.circPacketByIndex i).inner_at_v1 B.boundary_injective B.boundary_image
        hlohi hinterval hu hends hneg hbase
    let data : CGN.StrictCapBlockData D.A (S.capByIndex i) :=
      { n := B.n, m := m, phi := B.boundary,
        phi_injective := B.boundary_injective, phi_ccw := B.boundary_ccw,
        L := L, Packet := Packet, Hside := Hside, Block := Block, Hord := Hord }
    refine ⟨data, rfl, ?_⟩
    change HEq B.boundary B.boundary
    exact HEq.rfl
  rcases capByIndex_intervals_of_zeroCutBlocks S B hn iv iw hzero hiv hiw hblocks with
    ⟨hdirect, I⟩ | ⟨hmirror, I⟩
  · left
    have hS := mkData (i := S.surplusIdx) (u := zeroIndex hn) (lo := iv) (hi := iw)
      hdirect.apex_order.2 I.surplus hzero_surplus
      (Or.inl ⟨hiv_surplus, hiw_surplus⟩)
      (hneg hdirect.apex_order.1 hdirect.apex_order.2)
    have h2base : Problem97.signedArea2 (B.boundary iw)
        (B.boundary (zeroIndex hn)) (B.boundary iv) < 0 := by
      rw [hcycle]
      exact hneg hdirect.apex_order.1 hdirect.apex_order.2
    have h2 := mkData (i := S.oppIndex2) (u := iw) (lo := zeroIndex hn) (hi := iv)
      hdirect.apex_order.1 I.second hiw_second
      (Or.inl ⟨hzero_second, hiv_second⟩) h2base
    rcases hS with ⟨BS, hBS⟩
    rcases h2 with ⟨B2, hB2⟩
    exact ⟨BS, B2, hBS.1, hBS.2, hB2.1, hB2.2⟩
  · right
    have hS := mkData (i := S.surplusIdx) (u := zeroIndex hn) (lo := iw) (hi := iv)
      hmirror.apex_order.2 I.surplus hzero_surplus
      (Or.inr ⟨hiw_surplus, hiv_surplus⟩)
      (hneg hmirror.apex_order.1 hmirror.apex_order.2)
    have h1base : Problem97.signedArea2 (B.boundary iv)
        (B.boundary (zeroIndex hn)) (B.boundary iw) < 0 := by
      rw [hcycle]
      exact hneg hmirror.apex_order.1 hmirror.apex_order.2
    have h1 := mkData (i := S.oppIndex1) (u := iv) (lo := zeroIndex hn) (hi := iw)
      hmirror.apex_order.1 I.first hiv_first
      (Or.inr ⟨hzero_first, hiw_first⟩) h1base
    rcases hS with ⟨BS, hBS⟩
    rcases h1 with ⟨B1, hB1⟩
    exact ⟨BS, B1, hBS.1, hBS.2, hB1.1, hB1.2⟩

end ATailFrontierLiveClosure
end Problem97
