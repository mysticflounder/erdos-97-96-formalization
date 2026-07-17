/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RobustLargeRadiusGeometry
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Scratch: center localization for the large-radius shared critical pair

The large-radius minimal-deletion transition can produce two distinct points
in one strict opposite-cap interior which are equidistant from both the
physical opposite apex and one fresh critical center.  Ordered-cap uniqueness
forces that fresh center into the same strict cap interior.

This is a location producer.  It does not assert that the resulting packet is
contradictory.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustLargeRadiusCenterLocalizationScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailRobustLargeRadiusGeometryScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- The vertex opposite one indexed cap belongs to every other indexed cap. -/
private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hij : i ≠ j) :
    S.oppositeVertexByIndex i ∈ S.capByIndex j := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C2
  · exact False.elim (hij rfl)

/-- Two distinct centers in one indexed ordered cap cannot both bisect the
same distinct carrier pair outside that cap. -/
private theorem false_of_two_cap_centers_equidistant_outside_pair
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {c apex a b : ℝ²}
    (hcCap : c ∈ S.capByIndex k)
    (hapexCap : apex ∈ S.capByIndex k)
    (hc_ne_apex : c ≠ apex)
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
    (hcEq : dist c a = dist c b)
    (hapexEq : dist apex a = dist apex b) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hapexImage : apex ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hapexCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hapexImage with ⟨ia, _hia, hia⟩
  have hic_ne_ia : ic ≠ ia := by
    intro h
    apply hc_ne_apex
    calc
      c = L.points ic := hic.symm
      _ = L.points ia := by simp [h]
      _ = apex := hia
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  rcases lt_or_gt_of_ne hic_ne_ia with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt haA hbA haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hia] using hapexEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt haA hbA haOutside hbOutside hab
      (by simpa [hia] using hapexEq)
      (by simpa [hic] using hcEq)

/-- The fresh center in the shared-critical-pair residual lies in the same
strict opposite-cap interior as the two shared points. -/
theorem sharedCriticalPair_center_mem_capInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (packet : SharedCriticalPairAtLargeSecondApex D S radius) :
    packet.center ∈ S.capInteriorByIndex S.oppIndex2 := by
  classical
  have happ := oppApex2_eq_oppositeVertex_oppIndex2 S
  have hsourceClass :
      packet.source ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2) radius := by
    simpa [← happ] using packet.source_mem_radius
  have hpartnerClass :
      packet.partner ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2) radius := by
    simpa [← happ] using packet.partner_mem_radius
  have hsourceA : packet.source ∈ D.A :=
    (mem_selectedClass.mp hsourceClass).1
  have hpartnerA : packet.partner ∈ D.A :=
    (mem_selectedClass.mp hpartnerClass).1
  have hcenterEq :
      dist packet.center packet.source =
        dist packet.center packet.partner :=
    (packet.shell.toCriticalFourShell.support_eq_radius packet.source
      packet.shell.toCriticalFourShell.q_mem_support).trans
      (packet.shell.toCriticalFourShell.support_eq_radius packet.partner
        packet.partner_mem_shell).symm
  have hcenter_ne_opp :
      packet.center ≠ S.oppositeVertexByIndex S.oppIndex2 := by
    simpa [← happ] using packet.center_ne_physicalApex
  have hcenter_ne_left :
      packet.center ≠ S.leftOuterVertexByIndex S.oppIndex2 := by
    intro hcenter
    have hne := S.capInterior_pair_dist_ne_leftOuter_of_selectedClass
      S.oppIndex2 packet.source_mem_capInterior
        packet.partner_mem_capInterior packet.source_ne_partner
        hsourceClass hpartnerClass
    apply hne
    simpa [hcenter, dist_comm] using hcenterEq
  have hcenter_ne_right :
      packet.center ≠ S.rightOuterVertexByIndex S.oppIndex2 := by
    intro hcenter
    have hne := S.capInterior_pair_dist_ne_rightOuter_of_selectedClass
      S.oppIndex2 packet.source_mem_capInterior
        packet.partner_mem_capInterior packet.source_ne_partner
        hsourceClass hpartnerClass
    apply hne
    simpa [hcenter, dist_comm] using hcenterEq
  have hcenter_ne_surplusOpp :
      packet.center ≠ S.oppositeVertexByIndex S.surplusIdx := by
    intro hcenter
    apply hcenter_ne_right
    exact hcenter.trans
      S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx.symm
  have hcenter_ne_opp1 :
      packet.center ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    intro hcenter
    apply hcenter_ne_left
    exact hcenter.trans
      S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1.symm
  have hcenter_not_triangle : packet.center ∉ S.triangle.verts := by
    intro hcenterTriangle
    rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hcenterTriangle with
      hcenter | hcenter | hcenter
    · exact hcenter_ne_surplusOpp hcenter
    · exact hcenter_ne_opp1 hcenter
    · exact hcenter_ne_opp hcenter
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
      packet.center_mem_A with hcenterTriangle | ⟨j, hcenterInterior⟩
  · exact False.elim (hcenter_not_triangle hcenterTriangle)
  · have hj : j = S.oppIndex2 := by
      by_contra hji
      have hij : S.oppIndex2 ≠ j := Ne.symm hji
      have hcenterCap : packet.center ∈ S.capByIndex j :=
        S.capInteriorByIndex_subset_capByIndex j hcenterInterior
      have hapexCap :
          S.oppositeVertexByIndex S.oppIndex2 ∈ S.capByIndex j :=
        oppositeVertexByIndex_mem_capByIndex_of_ne S hij
      have hsourceOff : packet.source ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne
          packet.source_mem_capInterior hij
      have hpartnerOff : packet.partner ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne
          packet.partner_mem_capInterior hij
      have hapexEq :
          dist (S.oppositeVertexByIndex S.oppIndex2) packet.source =
            dist (S.oppositeVertexByIndex S.oppIndex2) packet.partner :=
        (mem_selectedClass.mp hsourceClass).2.trans
          (mem_selectedClass.mp hpartnerClass).2.symm
      exact false_of_two_cap_centers_equidistant_outside_pair S j
        hcenterCap hapexCap hcenter_ne_opp hsourceA hpartnerA
        packet.source_ne_partner hsourceOff hpartnerOff hcenterEq hapexEq
    simpa [hj] using hcenterInterior

/-- Exactly the two shared points of the packet lie in the packet's own
indexed cap on the fresh critical shell. -/
theorem sharedCriticalPair_shell_inter_cap_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (packet : SharedCriticalPairAtLargeSecondApex D S radius) :
    packet.shell.toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 =
      {packet.source, packet.partner} := by
  classical
  have hcenterCap : packet.center ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (sharedCriticalPair_center_mem_capInterior packet)
  have hinterLe :
      (packet.shell.toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2
        packet.shell.toCriticalFourShell.toSelectedFourClass hcenterCap
  have hpairSubset :
      ({packet.source, packet.partner} : Finset ℝ²) ⊆
        packet.shell.toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2 := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr
        ⟨packet.shell.toCriticalFourShell.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2
            packet.source_mem_capInterior⟩
    · have hxPartner : x = packet.partner := Finset.mem_singleton.mp hx
      subst x
      exact Finset.mem_inter.mpr
        ⟨packet.partner_mem_shell,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2
            packet.partner_mem_capInterior⟩
  have hinterLePair :
      (packet.shell.toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2).card ≤
        ({packet.source, packet.partner} : Finset ℝ²).card := by
    simpa [packet.source_ne_partner] using hinterLe
  exact (Finset.eq_of_subset_of_card_le hpairSubset hinterLePair).symm

#print axioms sharedCriticalPair_center_mem_capInterior
#print axioms sharedCriticalPair_shell_inter_cap_eq_pair

end ATailRobustLargeRadiusCenterLocalizationScratch
end Problem97
