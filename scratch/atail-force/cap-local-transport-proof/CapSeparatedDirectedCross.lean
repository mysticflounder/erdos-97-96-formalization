/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Adaptive-cap directed-cross consumer

The existing card-five consumer asks that a directed-cross blocker lie in the
distinguished surplus cap.  Ordered-cap uniqueness needs less: the first apex
and blocker may lie in any one indexed cap, provided both frontier sources lie
outside that cap.  This file records that strictly more flexible immediate
consumer on the actual `CriticalPairFrontier` type.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCapLocalTransportScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

private theorem capByIndex_surplusIdx_eq
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

/-- Two distinct centers in one indexed ordered cap cannot both be
equidistant from the same distinct carrier pair outside that cap. -/
private theorem false_of_two_cap_centers_equidistant_outside_pair
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {c a b : ℝ²}
    (hcCap : c ∈ S.capByIndex k)
    (hapexCap : S.oppApex1 ∈ S.capByIndex k)
    (hc_ne_apex : c ≠ S.oppApex1)
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
    (hcEq : dist c a = dist c b)
    (hapexEq : dist S.oppApex1 a = dist S.oppApex1 b) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hapexImage : S.oppApex1 ∈ Finset.univ.image L.points := by
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
      _ = S.oppApex1 := hia
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

/-- The adaptive-cap weakening of the old cap-local directed-cross field.

One orientation must give an indexed cap containing both the first apex and
the chosen blocker while excluding both source points; the blocker row must
also contain the opposite source. -/
def CapSeparatedDirectedCrossHypothesis
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) : Prop :=
  (∃ k : Fin 3,
      S.oppApex1 ∈ S.capByIndex k ∧
      H.centerAt P.q P.q_mem_A ∈ S.capByIndex k ∧
      P.q ∉ S.capByIndex k ∧
      P.w ∉ S.capByIndex k ∧
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support) ∨
    (∃ k : Fin 3,
      S.oppApex1 ∈ S.capByIndex k ∧
      H.centerAt P.w P.w_mem_A ∈ S.capByIndex k ∧
      P.w ∉ S.capByIndex k ∧
      P.q ∉ S.capByIndex k ∧
      P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support)

private theorem pair_q_mem_selectedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    P.q ∈ SelectedClass D.A S.oppApex1 r := by
  rcases Finset.mem_sdiff.mp P.q_mem_marginal with ⟨hqFilter, _hqOff⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr ⟨hqA, by simpa [dist_comm] using hqRadius⟩

private theorem pair_w_mem_selectedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    P.w ∈ SelectedClass D.A S.oppApex1 r := by
  rcases Finset.mem_sdiff.mp P.w_mem_marginal with ⟨hwFilter, _hwOff⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr ⟨hwA, by simpa [dist_comm] using hwRadius⟩

private theorem blocker_ne_oppApex1_of_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {z : ℝ²} (hzA : z ∈ D.A)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    H.centerAt z hzA ≠ S.oppApex1 := by
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase z) S.oppApex1 r).card :=
    selectedClass_erase_card_ge_of_succ_le
      (x := z) (n := 4) (by omega :
        5 ≤ (SelectedClass D.A S.oppApex1 r).card)
  exact ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
    H hzA ⟨r, hr, by simpa [SelectedClass] using hfourErase⟩

/-- The adaptive-cap field is an immediate contradiction on the actual
card-five frontier.  Blocker distinctness is not needed: this closes either
directed orientation even before splitting the two blocker centers. -/
theorem false_of_frontier_cardFive_capSeparatedDirectedCross
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hcross : CapSeparatedDirectedCrossHypothesis F.pair) :
    False := by
  let P := F.pair
  have hqClass := pair_q_mem_selectedClass P
  have hwClass := pair_w_mem_selectedClass P
  have hapexEq : dist S.oppApex1 P.q = dist S.oppApex1 P.w :=
    (mem_selectedClass.mp hqClass).2.trans
      (mem_selectedClass.mp hwClass).2.symm
  rcases hcross with hforward | hreverse
  · rcases hforward with
      ⟨k, hapexCap, hcenterCap, hqOff, hwOff, hwRow⟩
    have hcenterEq :
        dist (H.centerAt P.q P.q_mem_A) P.q =
          dist (H.centerAt P.q P.q_mem_A) P.w :=
      ((H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.q
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.w hwRow).symm
    exact false_of_two_cap_centers_equidistant_outside_pair S k
      hcenterCap hapexCap
      (blocker_ne_oppApex1_of_card_five
        P.q_mem_A hr hcard)
      P.q_mem_A P.w_mem_A P.q_ne_w hqOff hwOff hcenterEq hapexEq
  · rcases hreverse with
      ⟨k, hapexCap, hcenterCap, hwOff, hqOff, hqRow⟩
    have hcenterEq :
        dist (H.centerAt P.w P.w_mem_A) P.w =
          dist (H.centerAt P.w P.w_mem_A) P.q :=
      ((H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support_eq_radius
        P.w
        (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support_eq_radius
        P.q hqRow).symm
    exact false_of_two_cap_centers_equidistant_outside_pair S k
      hcenterCap hapexCap
      (blocker_ne_oppApex1_of_card_five
        P.w_mem_A hr hcard)
      P.w_mem_A P.q_mem_A P.q_ne_w.symm hwOff hqOff hcenterEq hapexEq.symm

/-- The former surplus-cap-only field implies the adaptive-cap field by
choosing `S.surplusIdx`.  Hence the new consumer is a genuine weakening of
the producer obligation, not a repackaging of the same designated cap. -/
theorem capSeparatedDirectedCross_of_surplusCapLocalCross
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hlocal :
      (P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∧
          H.centerAt P.q P.q_mem_A ∈ S.surplusCap) ∨
        (P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support ∧
          H.centerAt P.w P.w_mem_A ∈ S.surplusCap)) :
    CapSeparatedDirectedCrossHypothesis P := by
  have hcapEq := capByIndex_surplusIdx_eq S
  have hapex : S.oppApex1 ∈ S.capByIndex S.surplusIdx := by
    simpa [hcapEq] using oppApex1_mem_surplusCap S
  have hqOff : P.q ∉ S.capByIndex S.surplusIdx := by
    simpa [hcapEq] using (Finset.mem_sdiff.mp P.q_mem_marginal).2
  have hwOff : P.w ∉ S.capByIndex S.surplusIdx := by
    simpa [hcapEq] using (Finset.mem_sdiff.mp P.w_mem_marginal).2
  rcases hlocal with hforward | hreverse
  · exact Or.inl ⟨S.surplusIdx, hapex,
      by simpa [hcapEq] using hforward.2,
      hqOff, hwOff, hforward.1⟩
  · exact Or.inr ⟨S.surplusIdx, hapex,
      by simpa [hcapEq] using hreverse.2,
      hwOff, hqOff, hreverse.1⟩

#print axioms false_of_frontier_cardFive_capSeparatedDirectedCross
#print axioms capSeparatedDirectedCross_of_surplusCapLocalCross

end ATailCapLocalTransportScratch
end Problem97
