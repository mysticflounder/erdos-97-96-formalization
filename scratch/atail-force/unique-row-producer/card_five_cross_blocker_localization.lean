/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import card_five_interior_survivor_pair
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Card-five directed-cross blocker localization

For the strict-interior survivor pair produced by exact card five, any actual
blocker row which contains the opposite source has its center in the same
strict cap interior as the pair.  The proof first excludes all three Moser
vertices and then rules out either other cap by ordered-cap uniqueness.

This is a localization theorem, not the missing residual-row producer.  In
the coincident-blocker branch it leaves the common blocker's two residual
shell members outside the pair's cap; one still has to select a residual-
centered radius class containing the common pair.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueRowProducerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1'
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

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

private theorem blocker_ne_oppApex1_of_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : CardFiveInteriorSurvivorPair D S r)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    H.centerAt P.q (mem_selectedClass.mp (Finset.mem_inter.mp P.q_mem).1).1 ≠
      S.oppApex1 := by
  let hqA := (mem_selectedClass.mp (Finset.mem_inter.mp P.q_mem).1).1
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase P.q) S.oppApex1 r).card :=
    selectedClass_erase_card_ge_of_succ_le
      (by omega : 5 ≤ (SelectedClass D.A S.oppApex1 r).card)
  exact actual_blocker_ne_of_deletion_survives H hqA
    ⟨r, hr, by simpa [SelectedClass] using hfourErase⟩

/-- For the exact-card-five strict-interior survivor pair, a directed cross
hit forces the actual blocker into the pair's own strict cap interior. -/
theorem q_blocker_mem_firstInterior_of_cross
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : CardFiveInteriorSurvivorPair D S r)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hcross :
      P.w ∈ (H.selectedAt P.q
        (mem_selectedClass.mp (Finset.mem_inter.mp P.q_mem).1).1
        ).toCriticalFourShell.support) :
    H.centerAt P.q
        (mem_selectedClass.mp (Finset.mem_inter.mp P.q_mem).1).1 ∈
      S.capInteriorByIndex S.oppIndex1 := by
  classical
  let hqClass := (Finset.mem_inter.mp P.q_mem).1
  let hwClass := (Finset.mem_inter.mp P.w_mem).1
  let hqInterior := (Finset.mem_inter.mp P.q_mem).2
  let hwInterior := (Finset.mem_inter.mp P.w_mem).2
  let hqA := (mem_selectedClass.mp hqClass).1
  let hwA := (mem_selectedClass.mp hwClass).1
  let c := H.centerAt P.q hqA
  let K := (H.selectedAt P.q hqA).toCriticalFourShell
  have happ := oppApex1_eq_oppositeVertexByIndex_oppIndex1' S
  have hqClass' :
      P.q ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1) r := by
    simpa [← happ] using hqClass
  have hwClass' :
      P.w ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1) r := by
    simpa [← happ] using hwClass
  have hcA : c ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcEq : dist c P.q = dist c P.w :=
    (K.support_eq_radius P.q K.q_mem_support).trans
      (K.support_eq_radius P.w hcross).symm
  have hc_ne_apex : c ≠ S.oppApex1 := by
    simpa [c, hqA] using
      blocker_ne_oppApex1_of_card_five P (H := H) hr hcard
  have hc_ne_opp : c ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    simpa [← happ] using hc_ne_apex
  have hc_ne_left : c ≠ S.leftOuterVertexByIndex S.oppIndex1 := by
    intro hc
    have hne := S.capInterior_pair_dist_ne_leftOuter_of_selectedClass
      S.oppIndex1 hqInterior hwInterior P.q_ne_w hqClass' hwClass'
    apply hne
    simpa [hc, dist_comm] using hcEq
  have hc_ne_right : c ≠ S.rightOuterVertexByIndex S.oppIndex1 := by
    intro hc
    have hne := S.capInterior_pair_dist_ne_rightOuter_of_selectedClass
      S.oppIndex1 hqInterior hwInterior P.q_ne_w hqClass' hwClass'
    apply hne
    simpa [hc, dist_comm] using hcEq
  have hc_ne_surplusOpp :
      c ≠ S.oppositeVertexByIndex S.surplusIdx := by
    intro hc
    apply hc_ne_left
    exact hc.trans
      S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx.symm
  have hc_ne_opp2 : c ≠ S.oppositeVertexByIndex S.oppIndex2 := by
    intro hc
    apply hc_ne_right
    exact hc.trans
      S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2.symm
  have hc_not_triangle : c ∉ S.triangle.verts := by
    intro hcTriangle
    rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hcTriangle with
      hc | hc | hc
    · exact hc_ne_surplusOpp hc
    · exact hc_ne_opp hc
    · exact hc_ne_opp2 hc
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcA with
    hcTriangle | ⟨j, hcInterior⟩
  · exact False.elim (hc_not_triangle hcTriangle)
  · have hj : j = S.oppIndex1 := by
      by_contra hji
      have hij : S.oppIndex1 ≠ j := Ne.symm hji
      have hcCap : c ∈ S.capByIndex j :=
        S.capInteriorByIndex_subset_capByIndex j hcInterior
      have hapexCap :
          S.oppositeVertexByIndex S.oppIndex1 ∈ S.capByIndex j :=
        oppositeVertexByIndex_mem_capByIndex_of_ne S hij
      have hqOff : P.q ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hqInterior hij
      have hwOff : P.w ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hwInterior hij
      have hapexEq :
          dist (S.oppositeVertexByIndex S.oppIndex1) P.q =
            dist (S.oppositeVertexByIndex S.oppIndex1) P.w :=
        (mem_selectedClass.mp hqClass').2.trans
          (mem_selectedClass.mp hwClass').2.symm
      exact false_of_two_cap_centers_equidistant_outside_pair S j
        hcCap hapexCap hc_ne_opp hqA hwA P.q_ne_w
        hqOff hwOff hcEq hapexEq
    simpa [hj] using hcInterior

/-- Right-oriented mirror of `q_blocker_mem_firstInterior_of_cross`. -/
theorem w_blocker_mem_firstInterior_of_cross
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : CardFiveInteriorSurvivorPair D S r)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hcross :
      P.q ∈ (H.selectedAt P.w
        (mem_selectedClass.mp (Finset.mem_inter.mp P.w_mem).1).1
        ).toCriticalFourShell.support) :
    H.centerAt P.w
        (mem_selectedClass.mp (Finset.mem_inter.mp P.w_mem).1).1 ∈
      S.capInteriorByIndex S.oppIndex1 := by
  let P' : CardFiveInteriorSurvivorPair D S r :=
    { q := P.w
      w := P.q
      q_mem := P.w_mem
      w_mem := P.q_mem
      q_ne_w := P.q_ne_w.symm
      q_survives := P.w_survives
      w_survives := P.q_survives }
  simpa [P'] using
    q_blocker_mem_firstInterior_of_cross P' (H := H) hr hcard hcross

#print axioms q_blocker_mem_firstInterior_of_cross
#print axioms w_blocker_mem_firstInterior_of_cross

end ATailUniqueRowProducerScratch
end Problem97
