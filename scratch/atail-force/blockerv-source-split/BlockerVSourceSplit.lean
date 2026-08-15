import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy

/-! Experimental, source-faithful split of the `pentagonBlockerV` leaf. -/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailMinimalUniqueFourCover
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

private theorem scratch_equilateral_inner_nonneg {a b c : ℝ²}
    (hab : dist a b = dist a c)
    (habc : dist a b = dist b c) :
    0 ≤ inner ℝ (b - a) (c - a) := by
  rw [real_inner_eq_norm_mul_self_add_norm_mul_self_sub_norm_sub_mul_self_div_two]
  have hba : ‖b - a‖ = dist a b := by
    simpa [dist_comm] using (dist_eq_norm b a).symm
  have hca : ‖c - a‖ = dist a c := by
    simpa [dist_comm] using (dist_eq_norm c a).symm
  have hbc : ‖(b - a) - (c - a)‖ = dist b c := by
    rw [show (b - a) - (c - a) = b - c by abel]
    simpa [dist_comm] using (dist_eq_norm b c).symm
  rw [hba, hca, hbc, ← hab, ← habc]
  nlinarith [sq_nonneg (dist a b)]

/-- Scratch copy of the already-landed private generic equilateral-class kill.
It is duplicated here only so this standalone import can validate the proposed
`BlockerV` source split without changing production source. -/
private theorem scratch_equilateral_class_triple_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    {x y z : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A) (hzA : z ∈ D.A)
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z)
    (hxClass : x ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hyClass : y ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hzClass : z ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hxz_eq_yz : dist x z = dist y z)
    (hxy_eq_yz : dist x y = dist y z) :
    False := by
  classical
  have hxy_eq_xz : dist x y = dist x z :=
    hxy_eq_yz.trans hxz_eq_yz.symm
  have harea : signedArea2 x y z ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear hxA hyA hzA hxy hxz hyz
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  have hinnerX : 0 ≤ inner ℝ (y - x) (z - x) :=
    scratch_equilateral_inner_nonneg hxy_eq_xz hxy_eq_yz
  have hinnerY : 0 ≤ inner ℝ (z - y) (x - y) := by
    apply scratch_equilateral_inner_nonneg
    · calc
        dist y z = dist x y := hxy_eq_yz.symm
        _ = dist y x := dist_comm _ _
    · calc
        dist y z = dist x y := hxy_eq_yz.symm
        _ = dist x z := hxy_eq_xz
        _ = dist z x := dist_comm _ _
  have hinnerZ : 0 ≤ inner ℝ (x - z) (y - z) := by
    apply scratch_equilateral_inner_nonneg
    · calc
        dist z x = dist x z := dist_comm _ _
        _ = dist x y := hxy_eq_xz.symm
        _ = dist y z := hxy_eq_yz
        _ = dist z y := dist_comm _ _
    · calc
        dist z x = dist x z := dist_comm _ _
        _ = dist x y := hxy_eq_xz.symm
  have hphysicalX := (mem_selectedClass.mp hxClass).2
  have hphysicalY := (mem_selectedClass.mp hyClass).2
  have hphysicalZ := (mem_selectedClass.mp hzClass).2
  have hhull :
      S.oppApex2 ∈ convexHull ℝ ({x, y, z} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea
      (hphysicalX.trans hphysicalY.symm)
      (hphysicalX.trans hphysicalZ.symm)
      hinnerX hinnerY hinnerZ
  have happA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hneX : S.oppApex2 ≠ x := by
    intro h
    rw [h, dist_self] at hphysicalX
    exact (ne_of_gt P.hrho) hphysicalX.symm
  have hneY : S.oppApex2 ≠ y := by
    intro h
    rw [h, dist_self] at hphysicalY
    exact (ne_of_gt P.hrho) hphysicalY.symm
  have hneZ : S.oppApex2 ≠ z := by
    intro h
    rw [h, dist_self] at hphysicalZ
    exact (ne_of_gt P.hrho) hphysicalZ.symm
  have hsub :
      ({x, y, z} : Set ℝ²) ⊆ (D.A : Set ℝ²) \ {S.oppApex2} := by
    simp only [Set.insert_subset_iff, Set.singleton_subset_iff]
    exact
      ⟨⟨Finset.mem_coe.mpr hxA, fun h => hneX h.symm⟩,
       ⟨Finset.mem_coe.mpr hyA, fun h => hneY h.symm⟩,
       ⟨Finset.mem_coe.mpr hzA, fun h => hneZ h.symm⟩⟩
  exact D.convex S.oppApex2 (Finset.mem_coe.mpr happA)
    (convexHull_mono hsub hhull)

/-- The exhaustive source split below `pentagonBlockerV`, after discharging
the source, row-centre, and equilateral degeneracies. -/
theorem blockerV_centerAtV_residual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hblockerEqV :
      (lateFirstApexSystem R).centerAt packet.xv hxvA = P.v.1) :
    (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = packet.xu ∨
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1 ∨
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∉
        SelectedClass D.A S.oppApex2 P.rho := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxvVRow : packet.xv ∈ Kv.support :=
    (Finset.mem_inter.mp hxvInter).1
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2
  by_cases hcClass :
      Hlate.centerAt P.v.1 P.v.2 ∈
        SelectedClass D.A S.oppApex2 P.rho
  · rw [packet.physical_class] at hcClass
    simp only [Finset.mem_insert, Finset.mem_union, Finset.mem_singleton]
      at hcClass
    rcases hcClass with hdel | huvxu | hvxv
    · exact Or.inr (Or.inl hdel)
    · rcases huvxu with hu | hxu
      · exfalso
        have huNeV : P.u.1 ≠ P.v.1 := by
          intro h
          exact P.huNeV (Subtype.ext h)
        have huNeXv : P.u.1 ≠ packet.xv := by
          intro h
          apply P.huOmitted
          simpa only [h] using hxvVRow
        have hvNeXv : P.v.1 ≠ packet.xv := by
          intro h
          exact packet.xv_ne_v h.symm
        have hvxv_eq_vu : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
          rw [← hblockerEqV]
          exact (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
            (Kxv.support_eq_radius _ huXvRow).symm
        have huv_eq_uxv : dist P.u.1 P.v.1 = dist P.u.1 packet.xv := by
          rw [← hu]
          exact (Kv.support_eq_radius _ Kv.q_mem_support).trans
            (Kv.support_eq_radius _ hxvVRow).symm
        have huv_eq_vxv : dist P.u.1 P.v.1 = dist P.v.1 packet.xv := by
          calc
            dist P.u.1 P.v.1 = dist P.v.1 P.u.1 := dist_comm _ _
            _ = dist P.v.1 packet.xv := hvxv_eq_vu.symm
        have huxv_eq_vxv : dist P.u.1 packet.xv = dist P.v.1 packet.xv :=
          huv_eq_uxv.symm.trans huv_eq_vxv
        exact scratch_equilateral_class_triple_false
          P P.u.2 P.v.2 hxvA huNeV huNeXv hvNeXv P.huClass P.hvClass
            hxvClass huxv_eq_vxv huv_eq_vxv
      · exact Or.inl hxu
    · rcases hvxv with hv | hxv
      · exfalso
        exact (centerAt_ne_source Hlate P.v.1 P.v.2) hv
      · exfalso
        apply Kv.center_not_mem_support
        simpa only [hxv] using hxvVRow
  · exact Or.inr (Or.inr hcClass)

end ATailFrontierLiveClosure
end Problem97
