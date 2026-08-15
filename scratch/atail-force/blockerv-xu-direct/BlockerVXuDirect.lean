import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy

/-!
# Direct ordered-cap consumer for the `BlockerV/vRowBlockerXu` residual
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch

/-- Three successive perpendicular-bisector incidences cannot form a cycle
inside one strictly ordered minor cap. -/
theorem false_of_orderedCap_three_equidistant_betweenness_cycle
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    {iu ix iv iy : Fin m}
    (hiu_ix : iu ≠ ix)
    (hiy_iu : iy ≠ iu) (hiy_ix : iy ≠ ix)
    (hiv_iy : iv ≠ iy) (hiv_iu : iv ≠ iu)
    (hix_iv : ix ≠ iv)
    (hY : dist (L.points iy) (L.points iu) =
      dist (L.points iy) (L.points ix))
    (hV : dist (L.points iv) (L.points iy) =
      dist (L.points iv) (L.points iu))
    (hX : dist (L.points ix) (L.points iv) =
      dist (L.points ix) (L.points iy)) :
    False := by
  rcases lt_or_gt_of_ne hiu_ix with hiuix | hixiu
  · have hYbetween := CGN.index_strictly_between_of_equidistant
      Packet Hside Hord hiuix hiy_iu hiy_ix hY
    rcases lt_or_gt_of_ne hiy_iu with hiyiu | hiuiy
    · have hVbetween := CGN.index_strictly_between_of_equidistant
        Packet Hside Hord hiyiu hiv_iy hiv_iu hV
      rcases lt_or_gt_of_ne hiv_iy with hiviy | hiyiv
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiviy hix_iv hiy_ix.symm hX
        omega
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiyiv hiy_ix.symm hix_iv hX.symm
        omega
    · have hVbetween := CGN.index_strictly_between_of_equidistant
        Packet Hside Hord hiuiy hiv_iu hiv_iy hV.symm
      rcases lt_or_gt_of_ne hiv_iy with hiviy | hiyiv
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiviy hix_iv hiy_ix.symm hX
        omega
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiyiv hiy_ix.symm hix_iv hX.symm
        omega
  · have hYbetween := CGN.index_strictly_between_of_equidistant
      Packet Hside Hord hixiu hiy_ix hiy_iu hY.symm
    rcases lt_or_gt_of_ne hiy_iu with hiyiu | hiuiy
    · have hVbetween := CGN.index_strictly_between_of_equidistant
        Packet Hside Hord hiyiu hiv_iy hiv_iu hV
      rcases lt_or_gt_of_ne hiv_iy with hiviy | hiyiv
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiviy hix_iv hiy_ix.symm hX
        omega
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiyiv hiy_ix.symm hix_iv hX.symm
        omega
    · have hVbetween := CGN.index_strictly_between_of_equidistant
        Packet Hside Hord hiuiy hiv_iu hiv_iy hV.symm
      rcases lt_or_gt_of_ne hiv_iy with hiviy | hiyiv
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiviy hix_iv hiy_ix.symm hX
        omega
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiyiv hiy_ix.symm hix_iv hX.symm
        omega

/-- Scratch direct consumer for the live `BlockerV/vRowBlockerXu` child.
The three selected rows make `xv` lie between `u,xu`, `v` lie between
`xv,u`, and `xu` lie between `v,xv` in one ordered cap. -/
theorem scratch_false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerXu
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = packet.xu) :
    False := by
  classical
  have hxuInter :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuURow :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxvVRow :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxvInter).1
  have hcenterU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact
      ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hvNeXv : P.v.1 ≠ packet.xv := by
    intro h
    exact packet.xv_ne_v h.symm
  have huNeVpt : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)

  have hpairSubset :
      ({P.u.1, packet.xu} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    hpairSubset (by simp)
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    hpairSubset (by simp)
  have hvInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [← Q.hblockerEqV]
    exact Q.hblockerInterior

  have hY : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact
      (((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.support_eq_radius _
          ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.q_mem_support).trans
        ((((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support_eq_radius _ hxuURow).symm)
  have hV : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact
      (((lateFirstApexSystem R).selectedAt
        packet.xv Q.hxvA).toCriticalFourShell.support_eq_radius _
          ((lateFirstApexSystem R).selectedAt
            packet.xv Q.hxvA).toCriticalFourShell.q_mem_support).trans
        ((((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support_eq_radius _
            Q.huXvRow).symm)
  have hX : dist packet.xu P.v.1 = dist packet.xu packet.xv := by
    rw [← hcenterV]
    exact
      (((lateFirstApexSystem R).selectedAt
        P.v.1 P.v.2).toCriticalFourShell.support_eq_radius _
          ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.q_mem_support).trans
        ((((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support_eq_radius _ hxvVRow).symm)

  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have huImage : P.u.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 huInterior
  have hxuImage : packet.xu ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxuInterior
  have hvImage : P.v.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hvInterior
  have hxvImage : packet.xv ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 Q.hxvInterior
  rcases Finset.mem_image.mp huImage with ⟨iu, _hiuMem, hiu⟩
  rcases Finset.mem_image.mp hxuImage with ⟨ix, _hixMem, hix⟩
  rcases Finset.mem_image.mp hvImage with ⟨iv, _hivMem, hiv⟩
  rcases Finset.mem_image.mp hxvImage with ⟨iy, _hiyMem, hiy⟩
  have hiu_ix : iu ≠ ix := by
    intro h
    apply huNeXu
    rw [← hiu, ← hix, h]
  have hiy_iu : iy ≠ iu := by
    intro h
    apply huNeXv
    rw [← hiu, ← hiy, h]
  have hiy_ix : iy ≠ ix := by
    intro h
    apply hxuNeXv
    rw [← hix, ← hiy, h]
  have hiv_iy : iv ≠ iy := by
    intro h
    apply hvNeXv
    rw [← hiv, ← hiy, h]
  have hiv_iu : iv ≠ iu := by
    intro h
    apply huNeVpt
    rw [← hiu, ← hiv, h]
  have hix_iv : ix ≠ iv := by
    intro h
    apply hxuNeV
    rw [← hix, ← hiv, h]
  apply false_of_orderedCap_three_equidistant_betweenness_cycle
    Packet Hside Hord hiu_ix hiy_iu hiy_ix hiv_iy hiv_iu hix_iv
  · simpa only [hiu, hix, hiy] using hY
  · simpa only [hiu, hiv, hiy] using hV
  · simpa only [hix, hiv, hiy] using hX

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.scratch_false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerXu
