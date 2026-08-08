/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy

/-!
# Retained second-cap order for the exact-twelve Rigid221 lane

The older forced-order producer exported a fresh local `OrderedCap` and thereby
forgot the ambient boundary block from which it was cut.  This adapter repeats
the same checked metric argument while retaining `StrictCapBlockData`.  The
retained block is the common boundary object needed to transport the local
four-point order into the global three-cap order used by finite coverage.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch

/-- Cutting a retained ambient boundary at the right endpoint of its cap block
places every nonterminal local cap index in the corresponding wrapped slot.
This is the right-endpoint analogue of
`StrictCapBlockData.shifted_phi_cast_eq_points`; the terminal local point is
excluded because it becomes slot zero. -/
theorem shifted_at_right_endpoint_phi_cast_eq_points
    {A C : Finset ℝ²} (B : CGN.StrictCapBlockData A C) (t : Fin B.m)
    (ht : t.val + 1 < B.m) :
    let offset : Fin B.n := ⟨B.n - B.m + 1 + t.val, by
      have hspan := B.block_span
      have hhi := B.Block.hi.isLt
      omega⟩
    B.phi (offset + B.Block.hi) = B.L.points t := by
  let offset : Fin B.n := ⟨B.n - B.m + 1 + t.val, by
    have hspan := B.block_span
    have hhi := B.Block.hi.isLt
    omega⟩
  dsimp only
  rw [B.Block.points_eq]
  apply congrArg B.phi
  apply Fin.ext
  have hidx := B.idx_val_eq_lo_add t
  have hspan := B.block_span
  have hoffset : offset.val = B.n - B.m + 1 + t.val := rfl
  change (offset + B.Block.hi).val = (B.Block.idx t).val
  rw [Fin.val_add_eq_ite, hoffset]
  split <;> omega

/-- The four named second-cap points have their forced local order in a
`StrictCapBlockData` packet that still remembers the ambient CCW boundary.

This is a producer and transport ingress, not a contradiction. -/
theorem exists_retained_forced_secondCap_order
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    ∃ (B : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2))
        (iu ic ixv ixu : Fin B.m),
      ((B.L.points (CGN.firstIndex B.Packet.hm) =
            (S.triangleByIndex S.oppIndex2).v2 ∧
          B.L.points (CGN.lastIndex B.Packet.hm) =
            (S.triangleByIndex S.oppIndex2).v3) ∨
        (B.L.points (CGN.firstIndex B.Packet.hm) =
            (S.triangleByIndex S.oppIndex2).v3 ∧
          B.L.points (CGN.lastIndex B.Packet.hm) =
            (S.triangleByIndex S.oppIndex2).v2)) ∧
      B.L.points iu = P.u.1 ∧
      B.L.points ic =
        (lateFirstApexSystem R).centerAt packet.xv Q.hxvA ∧
      B.L.points ixv = packet.xv ∧
      B.L.points ixu = packet.xu ∧
      ((iu < ic ∧ ic < ixv ∧ ixv < ixu) ∨
        (ixu < ixv ∧ ixv < ic ∧ ic < iu)) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hxuKu : packet.xu ∈ Ku.support := by
    have hxuTrace :
        packet.xu ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simp [Ku, Hlate, packet.source_row_trace]
    exact (Finset.mem_inter.mp hxuTrace).1
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  have hY : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuKu).symm
  have hC : dist c P.u.1 = dist c packet.xv := by
    exact (Kxv.support_eq_radius _ Q.huXvRow).trans
      (Kxv.support_eq_radius _ Kxv.q_mem_support).symm
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClassBlocker_u_mem_secondCapInterior P packet
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClassBlocker_xu_mem_secondCapInterior P packet
  have huClass : P.u.1 ∈ SelectedClass D.A S.oppApex2 P.rho := P.huClass
  have hxuClass : packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hxvClass : packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have huNeC : P.u.1 ≠ c := by
    intro h
    apply Q.hblockerNotClass
    simpa only [c, Hlate, ← h] using huClass
  have hcNeXv : c ≠ packet.xv := by
    intro h
    apply Q.hblockerNotClass
    simpa only [c, Hlate, h] using hxvClass
  have hcNeXu : c ≠ packet.xu := by
    intro h
    apply Q.hblockerNotClass
    simpa only [c, Hlate, h] using hxuClass
  have huNeXv : P.u.1 ≠ packet.xv :=
    pentagonOffClassBlocker_u_ne_xv P packet
  have hxuNeXv : packet.xu ≠ packet.xv :=
    pentagonOffClassBlocker_xu_ne_xv P packet
  rcases S.capByIndex_cgn4g_strictCapBlockData_oriented
      D.convex S.oppIndex2 with ⟨B, hBorient⟩
  have huImage : P.u.1 ∈ Finset.univ.image B.L.points := by
    rw [B.cap_image]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 huInterior
  have hcImage : c ∈ Finset.univ.image B.L.points := by
    rw [B.cap_image]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 Q.hblockerInterior
  have hxvImage : packet.xv ∈ Finset.univ.image B.L.points := by
    rw [B.cap_image]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 Q.hxvInterior
  have hxuImage : packet.xu ∈ Finset.univ.image B.L.points := by
    rw [B.cap_image]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxuInterior
  rcases Finset.mem_image.mp huImage with ⟨iu, _hiuMem, hiu⟩
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hicMem, hic⟩
  rcases Finset.mem_image.mp hxvImage with ⟨ixv, _hixvMem, hixv⟩
  rcases Finset.mem_image.mp hxuImage with ⟨ixu, _hixuMem, hixu⟩
  have hiu_ic : iu ≠ ic := by
    intro h; apply huNeC; rw [← hiu, ← hic, h]
  have hic_ixv : ic ≠ ixv := by
    intro h; apply hcNeXv; rw [← hic, ← hixv, h]
  have hic_ixu : ic ≠ ixu := by
    intro h; apply hcNeXu; rw [← hic, ← hixu, h]
  have hiu_ixv : iu ≠ ixv := by
    intro h; apply huNeXv; rw [← hiu, ← hixv, h]
  have hiu_ixu : iu ≠ ixu := by
    intro h; apply packet.xu_ne_u; rw [← hixu, ← hiu, h]
  have hixv_ixu : ixv ≠ ixu := by
    intro h; apply hxuNeXv; rw [← hixu, ← hixv, h]
  have hYbetween :
      (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu) := by
    rcases lt_or_gt_of_ne hiu_ixu with h | h
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord h hiu_ixv.symm hixv_ixu (by
          simpa only [hiu, hixv, hixu] using hY))
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord h hixv_ixu hiu_ixv.symm (by
          simpa only [hiu, hixv, hixu] using hY.symm))
  have hCbetween :
      (iu < ic ∧ ic < ixv) ∨ (ixv < ic ∧ ic < iu) := by
    rcases lt_or_gt_of_ne hiu_ixv with h | h
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord h hiu_ic.symm hic_ixv (by
          simpa only [c, hiu, hic, hixv] using hC))
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord h hic_ixv hiu_ic.symm (by
          simpa only [c, hiu, hic, hixv] using hC.symm))
  refine ⟨B, iu, ic, ixv, ixu, hBorient, hiu, ?_, hixv, hixu, ?_⟩
  · simpa only [c, Hlate] using hic
  · rcases hYbetween with hYbetween | hYbetween <;>
      rcases hCbetween with hCbetween | hCbetween <;> omega

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
