import Erdos9796Proof.P97.ATail.FrontierLiveClosure
import Erdos9796Proof.P97.CircumcenterSide
import Erdos9796Proof.P97.ConvexIndepHelpers
import Erdos9796Proof.P97.Moser.NonDeg

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailMinimalUniqueFourCover
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

private theorem equilateral_inner_nonneg {a b c : ℝ²}
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

theorem directedCycle_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (W :
      ExactFourRigid221SourceHeavyOtherXvFirstGrowthPacket P packet)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hxvXuRow :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxu :=
    (Hlate.selectedAt packet.xu hxuA).toCriticalFourShell
  let Kxv :=
    (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell

  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2

  have huInterior :
      P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxuInterior :
      packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxvInterior :
      packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp

  have hcxuA : Hlate.centerAt packet.xu hxuA ∈ D.A := by
    exact Finset.mem_of_mem_erase Kxu.center_mem
  have hcxuNe :
      Hlate.centerAt packet.xu hxuA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xu hxuA
  have hcxuEq :
      dist (Hlate.centerAt packet.xu hxuA) packet.xu =
        dist (Hlate.centerAt packet.xu hxuA) packet.xv :=
    (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
      (Kxu.support_eq_radius _ hxvXuRow).symm
  have hphysicalXuXv :
      dist S.oppApex2 packet.xu = dist S.oppApex2 packet.xv :=
    (mem_selectedClass.mp hxuClass).2.trans
      (mem_selectedClass.mp hxvClass).2.symm
  have hcxuInterior :
      Hlate.centerAt packet.xu hxuA ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior hcxuA hcxuNe
      hxuInterior hxvInterior
      (by
        intro h
        apply hxuNotXvRow
        rw [h]
        exact Kxv.q_mem_support)
      hcxuEq hphysicalXuXv
  rw [W.secondInterior_eq_named] at hcxuInterior
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcxuInterior
  have hcxu :
      Hlate.centerAt packet.xu hxuA = P.u.1 := by
    rcases hcxuInterior with h | h | h
    · exact h
    · exact (centerAt_ne_source Hlate packet.xu hxuA h).elim
    · have hr := Kxu.support_eq_radius _ hxvXuRow
      rw [← h, dist_self] at hr
      linarith [Kxu.radius_pos]

  have hcxvA : Hlate.centerAt packet.xv hxvA ∈ D.A := by
    exact Finset.mem_of_mem_erase Kxv.center_mem
  have hcxvNe :
      Hlate.centerAt packet.xv hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xv hxvA
  have hcxvEq :
      dist (Hlate.centerAt packet.xv hxvA) packet.xv =
        dist (Hlate.centerAt packet.xv hxvA) P.u.1 :=
    (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ huXvRow).symm
  have hphysicalXvU :
      dist S.oppApex2 packet.xv = dist S.oppApex2 P.u.1 :=
    (mem_selectedClass.mp hxvClass).2.trans
      (mem_selectedClass.mp P.huClass).2.symm
  have hcxvInterior :
      Hlate.centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior hcxvA hcxvNe
      hxvInterior huInterior
      (by
        intro h
        apply huNotXuRow
        rw [← h]
        exact hxvXuRow)
      hcxvEq hphysicalXvU
  rw [W.secondInterior_eq_named] at hcxvInterior
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcxvInterior
  have hcxv :
      Hlate.centerAt packet.xv hxvA = packet.xu := by
    rcases hcxvInterior with h | h | h
    · have hr := Kxv.support_eq_radius _ huXvRow
      rw [← h, dist_self] at hr
      linarith [Kxv.radius_pos]
    · exact h
    · exact (centerAt_ne_source Hlate packet.xv hxvA h).elim

  have huxu_eq_uxv :
      dist P.u.1 packet.xu = dist P.u.1 packet.xv := by
    simpa [hcxu] using hcxuEq
  have huxu_eq_xuxv :
      dist P.u.1 packet.xu = dist packet.xu packet.xv := by
    have h := hcxvEq
    rw [hcxv] at h
    calc
      dist P.u.1 packet.xu = dist packet.xu P.u.1 := dist_comm _ _
      _ = dist packet.xu packet.xv := h.symm

  have hu_ne_xu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hu_ne_xv : P.u.1 ≠ packet.xv := by
    intro h
    apply huNotXuRow
    rw [h]
    exact hxvXuRow
  have hxu_ne_xv : packet.xu ≠ packet.xv := by
    intro h
    apply hxuNotXvRow
    rw [h]
    exact Kxv.q_mem_support
  have harea :
      signedArea2 P.u.1 packet.xu packet.xv ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear P.u.2 hxuA hxvA
      hu_ne_xu hu_ne_xv hxu_ne_xv
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)

  have hinnerU :
      0 ≤ inner ℝ (packet.xu - P.u.1) (packet.xv - P.u.1) :=
    equilateral_inner_nonneg huxu_eq_uxv huxu_eq_xuxv
  have hinnerXu :
      0 ≤ inner ℝ (packet.xv - packet.xu) (P.u.1 - packet.xu) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist packet.xu P.u.1 := dist_comm _ _
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist P.u.1 packet.xv := huxu_eq_uxv
        _ = dist packet.xv P.u.1 := dist_comm _ _
  have hinnerXv :
      0 ≤ inner ℝ (P.u.1 - packet.xv) (packet.xu - packet.xv) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm
        _ = dist packet.xu packet.xv := huxu_eq_xuxv
        _ = dist packet.xv packet.xu := dist_comm _ _
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm

  have hphysicalU := (mem_selectedClass.mp P.huClass).2
  have hphysicalXu := (mem_selectedClass.mp hxuClass).2
  have hphysicalXv := (mem_selectedClass.mp hxvClass).2
  have hhull :
      S.oppApex2 ∈
        convexHull ℝ ({P.u.1, packet.xu, packet.xv} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea
      (hphysicalU.trans hphysicalXu.symm)
      (hphysicalU.trans hphysicalXv.symm)
      hinnerU hinnerXu hinnerXv
  have happA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hneU : S.oppApex2 ≠ P.u.1 := by
    intro h
    rw [h, dist_self] at hphysicalU
    exact (ne_of_gt P.hrho) hphysicalU.symm
  have hneXu : S.oppApex2 ≠ packet.xu := by
    intro h
    rw [h, dist_self] at hphysicalXu
    exact (ne_of_gt P.hrho) hphysicalXu.symm
  have hneXv : S.oppApex2 ≠ packet.xv := by
    intro h
    rw [h, dist_self] at hphysicalXv
    exact (ne_of_gt P.hrho) hphysicalXv.symm
  have hsub :
      ({P.u.1, packet.xu, packet.xv} : Set ℝ²) ⊆
        (D.A : Set ℝ²) \ {S.oppApex2} := by
    simp only [Set.insert_subset_iff, Set.singleton_subset_iff]
    exact
      ⟨⟨Finset.mem_coe.mpr P.u.2, fun h => hneU h.symm⟩,
       ⟨Finset.mem_coe.mpr hxuA, fun h => hneXu h.symm⟩,
       ⟨Finset.mem_coe.mpr hxvA, fun h => hneXv h.symm⟩⟩
  exact D.convex S.oppApex2 (Finset.mem_coe.mpr happA)
    (convexHull_mono hsub hhull)

end ATailFrontierLiveClosure
end Problem97
