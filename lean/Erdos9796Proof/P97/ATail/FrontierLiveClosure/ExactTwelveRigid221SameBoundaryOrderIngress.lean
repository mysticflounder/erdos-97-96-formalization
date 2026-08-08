/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221BoundaryOrderIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221RetainedSecondCapOrder

/-!
# Same-boundary forced order for the exact-twelve Rigid221 lane

This file closes the transport gap between the retained local second-cap order
and the global three-cap boundary order.  The resulting order uses one common
CCW boundary enumeration: its cap blocks and its four-point forced order are
not obtained from independently chosen convex enumerations.

This is an ingress theorem for ordered finite coverage, not a contradiction.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge
open Census554.ZeroCutBoundaryIndexing
open ExactTwelveCarrierIngress

/-- The forced order of the four named labels in the second-opposite cap. -/
def FrozenForcedSecondCapOrder (position : Label → Nat) : Prop :=
  (position 6 < position 7 ∧
      position 7 < position 8 ∧ position 8 < position 9) ∨
    (position 9 < position 8 ∧
      position 8 < position 7 ∧ position 7 < position 6)

/-- The exact-twelve source branch supplies one common zero-cut boundary order
with all three cap blocks and the retained four-point second-cap order. -/
theorem FrozenRoleLabeling.exists_frozenBoundaryOrder_with_forced_secondCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (interiors : FrozenInteriorProfile labeling)
    (hcard : D.A.card = 12) :
    ∃ order : FrozenBoundaryOrder (fun label => (labeling.e.symm label).1),
      FrozenForcedSecondCapOrder order.position := by
  classical
  rcases exists_retained_forced_secondCap_order Q with
    ⟨B, iu, ic, ixv, ixu, hBorient, hiu, hic, hixv, hixu, hforced⟩
  have hn : 0 < B.n := by
    rw [B.ambient_card_eq, hcard]
    decide
  have hmn : B.m ≤ B.n := by
    have hspan := B.block_span
    have hhi := B.Block.hi.isLt
    omega
  rcases hBorient with hforward | hmirror
  · let cut : Fin B.n := B.Block.lo
    let boundary : Fin B.n → ℝ² := fun point => B.phi (point + cut)
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using injective_cyclicShift B.phi_injective cut
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      calc
        Finset.univ.image boundary = Finset.univ.image B.phi := by
          simpa only [boundary] using image_univ_cyclicShift B.phi cut
        _ = D.A := B.Block.phi_image
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw cut
    let BI : BoundaryIndexing D.A :=
      boundaryIndexingOfBoundary boundary hboundaryInjective
        hboundaryImage hboundaryCcw
    have hnBI : 0 < BI.n := by
      change 0 < B.n
      exact hn
    have hzero :
        BI.boundary (zeroIndex hnBI) =
          S.oppositeVertexByIndex S.surplusIdx := by
      change boundary (zeroIndex hnBI) =
        S.oppositeVertexByIndex S.surplusIdx
      calc
        boundary (zeroIndex hnBI) =
            B.L.points (CGN.firstIndex B.Packet.hm) := by
          simpa [boundary, cut, zeroIndex, CGN.firstIndex] using
            B.shifted_phi_cast_eq_points
              (CGN.firstIndex B.Packet.hm)
        _ = (S.triangleByIndex S.oppIndex2).v2 := hforward.1
        _ = S.oppositeVertexByIndex S.surplusIdx :=
          S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx
    rcases capBlocks_of_zeroCutBoundary S BI hnBI hzero with
      ⟨iv, iw, hiv, hiw, hblocks⟩
    let order : FrozenBoundaryOrder
        (fun label => (labeling.e.symm label).1) :=
      labeling.frozenBoundaryOrder_of_capBlocks interiors hcard BI hnBI iv iw
        hzero hiv hiw hblocks
    let slot (t : Fin B.m) : Fin B.n := Fin.castLE hmn t
    have hslotPoint (t : Fin B.m) :
        boundary (slot t) = B.L.points t := by
      simpa [boundary, cut, slot] using B.shifted_phi_cast_eq_points t
    have hindex6 : BI.indexOf (labeling.e.symm 6) = slot iu := by
      apply BI.boundary_injective
      calc
        BI.boundary (BI.indexOf (labeling.e.symm 6)) =
            (labeling.e.symm 6).1 := BI.point_eq _
        _ = B.L.points iu := labeling.u.trans hiu.symm
        _ = BI.boundary (slot iu) := by
          change B.L.points iu = boundary (slot iu)
          exact (hslotPoint iu).symm
    have hindex7 : BI.indexOf (labeling.e.symm 7) = slot ic := by
      apply BI.boundary_injective
      calc
        BI.boundary (BI.indexOf (labeling.e.symm 7)) =
            (labeling.e.symm 7).1 := BI.point_eq _
        _ = B.L.points ic := labeling.blockerXv.trans hic.symm
        _ = BI.boundary (slot ic) := by
          change B.L.points ic = boundary (slot ic)
          exact (hslotPoint ic).symm
    have hindex8 : BI.indexOf (labeling.e.symm 8) = slot ixv := by
      apply BI.boundary_injective
      calc
        BI.boundary (BI.indexOf (labeling.e.symm 8)) =
            (labeling.e.symm 8).1 := BI.point_eq _
        _ = B.L.points ixv := labeling.xv.trans hixv.symm
        _ = BI.boundary (slot ixv) := by
          change B.L.points ixv = boundary (slot ixv)
          exact (hslotPoint ixv).symm
    have hindex9 : BI.indexOf (labeling.e.symm 9) = slot ixu := by
      apply BI.boundary_injective
      calc
        BI.boundary (BI.indexOf (labeling.e.symm 9)) =
            (labeling.e.symm 9).1 := BI.point_eq _
        _ = B.L.points ixu := labeling.xu.trans hixu.symm
        _ = BI.boundary (slot ixu) := by
          change B.L.points ixu = boundary (slot ixu)
          exact (hslotPoint ixu).symm
    refine ⟨order, ?_⟩
    have hpos6 : order.position 6 = (slot iu).val := by
      change (BI.indexOf (labeling.e.symm 6)).val = (slot iu).val
      exact congrArg Fin.val hindex6
    have hpos7 : order.position 7 = (slot ic).val := by
      change (BI.indexOf (labeling.e.symm 7)).val = (slot ic).val
      exact congrArg Fin.val hindex7
    have hpos8 : order.position 8 = (slot ixv).val := by
      change (BI.indexOf (labeling.e.symm 8)).val = (slot ixv).val
      exact congrArg Fin.val hindex8
    have hpos9 : order.position 9 = (slot ixu).val := by
      change (BI.indexOf (labeling.e.symm 9)).val = (slot ixu).val
      exact congrArg Fin.val hindex9
    rw [FrozenForcedSecondCapOrder, hpos6, hpos7, hpos8, hpos9]
    simpa [slot] using hforced
  · have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
      pentagonOffClassBlocker_u_mem_secondCapInterior P packet
    have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
      pentagonOffClassBlocker_xu_mem_secondCapInterior P packet
    have ltLastOfInterior {t : Fin B.m} {x : ℝ²}
        (hx : x ∈ S.capInteriorByIndex S.oppIndex2)
        (hpoint : B.L.points t = x) : t.val + 1 < B.m := by
      have htNe : t ≠ CGN.lastIndex B.Packet.hm := by
        intro ht
        exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx <| by
          calc
            x = B.L.points t := hpoint.symm
            _ = B.L.points (CGN.lastIndex B.Packet.hm) := congrArg B.L.points ht
            _ = (S.triangleByIndex S.oppIndex2).v2 := hmirror.2
      have hlastVal : (CGN.lastIndex B.Packet.hm).val = B.m - 1 := rfl
      have htValNe : t.val ≠ B.m - 1 := by
        intro htVal
        apply htNe
        apply Fin.ext
        simpa only [hlastVal] using htVal
      have htLt := t.isLt
      omega
    have hiuLast := ltLastOfInterior huInterior hiu
    have hicLast := ltLastOfInterior Q.hblockerInterior hic
    have hixvLast := ltLastOfInterior Q.hxvInterior hixv
    have hixuLast := ltLastOfInterior hxuInterior hixu
    let cut : Fin B.n := B.Block.hi
    let boundary : Fin B.n → ℝ² := fun point => B.phi (point + cut)
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using injective_cyclicShift B.phi_injective cut
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      calc
        Finset.univ.image boundary = Finset.univ.image B.phi := by
          simpa only [boundary] using image_univ_cyclicShift B.phi cut
        _ = D.A := B.Block.phi_image
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw cut
    let BI : BoundaryIndexing D.A :=
      boundaryIndexingOfBoundary boundary hboundaryInjective
        hboundaryImage hboundaryCcw
    have hnBI : 0 < BI.n := by
      change 0 < B.n
      exact hn
    have hzero :
        BI.boundary (zeroIndex hnBI) =
          S.oppositeVertexByIndex S.surplusIdx := by
      change boundary (zeroIndex hnBI) =
        S.oppositeVertexByIndex S.surplusIdx
      calc
        boundary (zeroIndex hnBI) =
            B.L.points (CGN.lastIndex B.Packet.hm) := by
          simp only [boundary, cut, zeroIndex, B.Block.points_eq,
            B.Block.idx_last]
          apply congrArg B.phi
          letI : NeZero B.n := ⟨Nat.ne_of_gt hn⟩
          exact Fin.zero_add B.Block.hi
        _ = (S.triangleByIndex S.oppIndex2).v2 := hmirror.2
        _ = S.oppositeVertexByIndex S.surplusIdx :=
          S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx
    rcases capBlocks_of_zeroCutBoundary S BI hnBI hzero with
      ⟨iv, iw, hiv, hiw, hblocks⟩
    let order : FrozenBoundaryOrder
        (fun label => (labeling.e.symm label).1) :=
      labeling.frozenBoundaryOrder_of_capBlocks interiors hcard BI hnBI iv iw
        hzero hiv hiw hblocks
    let slot (t : Fin B.m) (ht : t.val + 1 < B.m) : Fin B.n :=
      ⟨B.n - B.m + 1 + t.val, by
        have hspan := B.block_span
        have hhi := B.Block.hi.isLt
        omega⟩
    have hslotPoint (t : Fin B.m) (ht : t.val + 1 < B.m) :
        boundary (slot t ht) = B.L.points t := by
      simpa [boundary, cut, slot] using
        shifted_at_right_endpoint_phi_cast_eq_points B t ht
    have hindex6 : BI.indexOf (labeling.e.symm 6) = slot iu hiuLast := by
      apply BI.boundary_injective
      calc
        BI.boundary (BI.indexOf (labeling.e.symm 6)) =
            (labeling.e.symm 6).1 := BI.point_eq _
        _ = B.L.points iu := labeling.u.trans hiu.symm
        _ = BI.boundary (slot iu hiuLast) := by
          change B.L.points iu = boundary (slot iu hiuLast)
          exact (hslotPoint iu hiuLast).symm
    have hindex7 : BI.indexOf (labeling.e.symm 7) = slot ic hicLast := by
      apply BI.boundary_injective
      calc
        BI.boundary (BI.indexOf (labeling.e.symm 7)) =
            (labeling.e.symm 7).1 := BI.point_eq _
        _ = B.L.points ic := labeling.blockerXv.trans hic.symm
        _ = BI.boundary (slot ic hicLast) := by
          change B.L.points ic = boundary (slot ic hicLast)
          exact (hslotPoint ic hicLast).symm
    have hindex8 : BI.indexOf (labeling.e.symm 8) = slot ixv hixvLast := by
      apply BI.boundary_injective
      calc
        BI.boundary (BI.indexOf (labeling.e.symm 8)) =
            (labeling.e.symm 8).1 := BI.point_eq _
        _ = B.L.points ixv := labeling.xv.trans hixv.symm
        _ = BI.boundary (slot ixv hixvLast) := by
          change B.L.points ixv = boundary (slot ixv hixvLast)
          exact (hslotPoint ixv hixvLast).symm
    have hindex9 : BI.indexOf (labeling.e.symm 9) = slot ixu hixuLast := by
      apply BI.boundary_injective
      calc
        BI.boundary (BI.indexOf (labeling.e.symm 9)) =
            (labeling.e.symm 9).1 := BI.point_eq _
        _ = B.L.points ixu := labeling.xu.trans hixu.symm
        _ = BI.boundary (slot ixu hixuLast) := by
          change B.L.points ixu = boundary (slot ixu hixuLast)
          exact (hslotPoint ixu hixuLast).symm
    refine ⟨order, ?_⟩
    have hpos6 : order.position 6 = (slot iu hiuLast).val := by
      change (BI.indexOf (labeling.e.symm 6)).val = (slot iu hiuLast).val
      exact congrArg Fin.val hindex6
    have hpos7 : order.position 7 = (slot ic hicLast).val := by
      change (BI.indexOf (labeling.e.symm 7)).val = (slot ic hicLast).val
      exact congrArg Fin.val hindex7
    have hpos8 : order.position 8 = (slot ixv hixvLast).val := by
      change (BI.indexOf (labeling.e.symm 8)).val = (slot ixv hixvLast).val
      exact congrArg Fin.val hindex8
    have hpos9 : order.position 9 = (slot ixu hixuLast).val := by
      change (BI.indexOf (labeling.e.symm 9)).val = (slot ixu hixuLast).val
      exact congrArg Fin.val hindex9
    rw [FrozenForcedSecondCapOrder, hpos6, hpos7, hpos8, hpos9]
    rcases hforced with hforced | hforced
    · left
      dsimp only [slot]
      omega
    · right
      dsimp only [slot]
      omega

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
