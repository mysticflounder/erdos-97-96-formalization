import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch

/-- Three successive perpendicular-bisector incidences cannot form a cycle
inside one strictly ordered minor cap. -/
theorem false_of_orderedCap_three_equidistant_betweenness_cycle_orderFree
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

/-- Order-free proof of the live `BlockerV / v-row blocker = xu` leaf. -/
theorem false_of_pentagonBlockerV_vRowBlockerXu_orderFree
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
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  have hxuInter :
      packet.xu ∈ Ku.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
    rw [show Ku.support ∩ SelectedClass D.A S.oppApex2 P.rho =
      {P.u.1, packet.xu} by simpa [Ku, Hlate] using packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
    rw [show Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho =
      {P.v.1, packet.xv} by simpa [Kv, Hlate] using packet.opposite_row_trace]
    simp
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeV : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [h] using hxuURow
  have hxvNotURow : packet.xv ∉ Ku.support := by
    intro h
    rw [← hcenterU] at h
    exact Ku.center_not_mem_support h
  have hxvNeU : packet.xv ≠ P.u.1 := by
    intro h
    apply hxvNotURow
    simpa only [h] using Ku.q_mem_support
  have hxvNeXu : packet.xv ≠ packet.xu := by
    intro h
    apply hxvNotURow
    simpa only [h] using hxuURow
  have hY : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    have h := (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
    simpa only [Ku, Hlate, hcenterU] using h
  have hV : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    have h := (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ Q.huXvRow).symm
    simpa only [Kxv, Hlate, Q.hblockerEqV] using h
  have hX : dist packet.xu P.v.1 = dist packet.xu packet.xv := by
    have h := (Kv.support_eq_radius _ Kv.q_mem_support).trans
      (Kv.support_eq_radius _ hxvVRow).symm
    simpa only [Kv, Hlate, hcenterV] using h
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hmem : P.u.1 ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      simp
    exact (Finset.mem_inter.mp hmem).2
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hmem : packet.xu ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      simp
    exact (Finset.mem_inter.mp hmem).2
  have hvInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    simpa only [Q.hblockerEqV] using Q.hblockerInterior
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
  rcases Finset.mem_image.mp huImage with ⟨iu, _hiu, hiu⟩
  rcases Finset.mem_image.mp hxuImage with ⟨ix, _hix, hix⟩
  rcases Finset.mem_image.mp hvImage with ⟨iv, _hiv, hiv⟩
  rcases Finset.mem_image.mp hxvImage with ⟨iy, _hiy, hiy⟩
  apply false_of_orderedCap_three_equidistant_betweenness_cycle_orderFree
    Packet Hside Hord
  · intro h
    exact huNeXu (hiu ▸ hix ▸ congrArg L.points h)
  · intro h
    exact hxvNeU (hiy ▸ hiu ▸ congrArg L.points h)
  · intro h
    exact hxvNeXu (hiy ▸ hix ▸ congrArg L.points h)
  · intro h
    exact hvNeXv (hiv ▸ hiy ▸ congrArg L.points h)
  · intro h
    exact huNeV ((hiv ▸ hiu ▸ congrArg L.points h).symm)
  · intro h
    exact hxuNeV (hix ▸ hiv ▸ congrArg L.points h)
  · simpa only [hiu, hix, hiy] using hY
  · simpa only [hiu, hiv, hiy] using hV
  · simpa only [hix, hiv, hiy] using hX

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.false_of_orderedCap_three_equidistant_betweenness_cycle_orderFree
#print axioms Problem97.ATailFrontierLiveClosure.false_of_pentagonBlockerV_vRowBlockerXu_orderFree
