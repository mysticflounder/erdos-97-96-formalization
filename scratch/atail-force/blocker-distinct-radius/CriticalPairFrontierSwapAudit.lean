/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import PacketReorientationAudit

/-!
# Critical-pair frontier under fixed-surplus reorientation

An existing critical-pair frontier cannot be transported with the same
source pair through the non-surplus swap: the old pair is equidistant from
the old first apex but has provably distinct distances from the old second
apex, which becomes the new first apex.

A fresh frontier does not require a new apex-symmetric theorem.  The current
`exists_criticalPairFrontier_of_K4` theorem is already quantified over an
arbitrary `SurplusCapPacket`, so it reconstructs a new pair after swapping the
packet and transporting the carrier-indexed critical-shell system.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerDistinctRadiusScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

/-- The old survivor pair has distinct radii about the swapped packet's first
apex.  This is the exact obstruction to transporting its marginal fields. -/
theorem survivorPair_dist_ne_at_swapped_firstApex
    {D Dsw : CounterexampleData} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (hswap : CompleteNonSurplusSwap D Dsw)
    (P : SurvivorPairRelocationPacket D D.packet r H) :
    dist Dsw.packet.oppApex1 P.q ≠ dist Dsw.packet.oppApex1 P.w := by
  rw [hswap.toNonSurplusSwap.oppApex1_eq]
  exact P.oppApex2_dist_ne

/-- Consequently there is no radius placing both old sources in one selected
class about the swapped first apex. -/
theorem survivorPair_not_common_radius_at_swapped_firstApex
    {D Dsw : CounterexampleData} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (hswap : CompleteNonSurplusSwap D Dsw)
    (P : SurvivorPairRelocationPacket D D.packet r H) :
    ¬ ∃ rho : ℝ,
      dist P.q Dsw.packet.oppApex1 = rho ∧
      dist P.w Dsw.packet.oppApex1 = rho := by
  rintro ⟨rho, hq, hw⟩
  apply survivorPair_dist_ne_at_swapped_firstApex hswap P
  simpa only [dist_comm] using hq.trans hw.symm

/-- No survivor relocation packet for the swapped datum can reuse both
sources of the old packet. -/
theorem no_same_pair_survivorPacket_after_completeSwap
    {D Dsw : CounterexampleData} {r rho : ℝ}
    {H : CriticalShellSystem D.A}
    {Hsw : CriticalShellSystem Dsw.A}
    (hswap : CompleteNonSurplusSwap D Dsw)
    (P : SurvivorPairRelocationPacket D D.packet r H) :
    ¬ ∃ Psw : SurvivorPairRelocationPacket Dsw Dsw.packet rho Hsw,
      Psw.q = P.q ∧ Psw.w = P.w := by
  rintro ⟨Psw, hq, hw⟩
  apply survivorPair_not_common_radius_at_swapped_firstApex hswap P
  refine ⟨rho, ?_, ?_⟩
  · have hqRadius :=
      (Finset.mem_filter.mp
        (Finset.mem_sdiff.mp Psw.q_mem_marginal).1).2
    simpa only [hq] using hqRadius
  · have hwRadius :=
      (Finset.mem_filter.mp
        (Finset.mem_sdiff.mp Psw.w_mem_marginal).1).2
    simpa only [hw] using hwRadius

/-- In particular, a complete critical-pair frontier after the swap cannot
reuse the old ordered source pair. -/
theorem no_same_pair_criticalPairFrontier_after_completeSwap
    {D Dsw : CounterexampleData} {r rho : ℝ}
    {H : CriticalShellSystem D.A}
    {Hsw : CriticalShellSystem Dsw.A}
    (hswap : CompleteNonSurplusSwap D Dsw)
    (P : SurvivorPairRelocationPacket D D.packet r H) :
    ¬ ∃ Fsw : CriticalPairFrontier Dsw Dsw.packet rho Hsw,
      Fsw.pair.q = P.q ∧ Fsw.pair.w = P.w := by
  rintro ⟨Fsw, hq, hw⟩
  exact no_same_pair_survivorPacket_after_completeSwap hswap P
    ⟨Fsw.pair, hq, hw⟩

/-- The existing arbitrary-packet frontier constructor reconstructs a fresh
frontier after the fixed-surplus swap.  The new frontier's second apex is the
old first apex. -/
theorem exists_freshCriticalPairFrontier_after_completeSwap
    {D Dsw : CounterexampleData}
    (hswap : CompleteNonSurplusSwap D Dsw)
    (H : CriticalShellSystem D.A) :
    ∃ Hsw : CriticalShellSystem Dsw.A,
      ∃ rho : ℝ, 0 < rho ∧
        4 ≤ (SelectedClass Dsw.A Dsw.packet.oppApex1 rho).card ∧
        Dsw.packet.oppApex2 = D.packet.oppApex1 ∧
        Nonempty (CriticalPairFrontier Dsw Dsw.packet rho Hsw) := by
  let Hsw : CriticalShellSystem Dsw.A :=
    hswap.toNonSurplusSwap.carrier_eq.symm ▸ H
  obtain ⟨rho, hrho, hfour, hfrontier⟩ :=
    exists_criticalPairFrontier_of_K4 Dsw Dsw.packet Hsw
  exact ⟨Hsw, rho, hrho, hfour, hswap.oppApex2_eq, hfrontier⟩

/-- Direct chosen-index form: every right-oriented packet from the preceding
audit admits a fresh critical-pair frontier whose second apex is the physical
Moser vertex opposite the originally selected cap. -/
theorem exists_freshCriticalPairFrontier_at_rightOrientedIndex
    {D : CounterexampleData} {j : Fin 3}
    (R : RightOrientedNonSurplusIndex D j)
    (H : CriticalShellSystem D.A) :
    ∃ Hright : CriticalShellSystem R.data.A,
      ∃ rho : ℝ, 0 < rho ∧
        4 ≤ (SelectedClass R.data.A R.data.packet.oppApex1 rho).card ∧
        R.data.packet.oppApex2 = D.packet.oppositeVertexByIndex j ∧
        Nonempty
          (CriticalPairFrontier R.data R.data.packet rho Hright) := by
  let Hright : CriticalShellSystem R.data.A := R.carrier_eq.symm ▸ H
  obtain ⟨rho, hrho, hfour, hfrontier⟩ :=
    exists_criticalPairFrontier_of_K4 R.data R.data.packet Hright
  exact ⟨Hright, rho, hrho, hfour, R.targetApex_eq, hfrontier⟩

/-- Role-free physical projection of a freshly reconstructed swapped
frontier.  Its pair is an off-surplus common-radius pair about the old second
apex, and simultaneous deletion preserves K4 at the old first apex. -/
theorem criticalPairFrontier_after_swap_physical_projection
    {D Dsw : CounterexampleData}
    (hswap : CompleteNonSurplusSwap D Dsw)
    {rho : ℝ} {Hsw : CriticalShellSystem Dsw.A}
    (F : CriticalPairFrontier Dsw Dsw.packet rho Hsw) :
    F.pair.q ∈ D.A ∧
      F.pair.w ∈ D.A ∧
      F.pair.q ≠ F.pair.w ∧
      F.pair.q ∉ D.packet.surplusCap ∧
      F.pair.w ∉ D.packet.surplusCap ∧
      dist F.pair.q D.packet.oppApex2 = rho ∧
      dist F.pair.w D.packet.oppApex2 = rho ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.q).erase F.pair.w) D.packet.oppApex1 := by
  have hqA : F.pair.q ∈ D.A := by
    rw [← hswap.toNonSurplusSwap.carrier_eq]
    exact F.pair.q_mem_A
  have hwA : F.pair.w ∈ D.A := by
    rw [← hswap.toNonSurplusSwap.carrier_eq]
    exact F.pair.w_mem_A
  have hqOffSw : F.pair.q ∉ Dsw.packet.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hwOffSw : F.pair.w ∉ Dsw.packet.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.w_mem_marginal).2
  have hqOff : F.pair.q ∉ D.packet.surplusCap := by
    simpa only [hswap.toNonSurplusSwap.surplusCap_eq] using hqOffSw
  have hwOff : F.pair.w ∉ D.packet.surplusCap := by
    simpa only [hswap.toNonSurplusSwap.surplusCap_eq] using hwOffSw
  have hqRadiusSw : dist F.pair.q Dsw.packet.oppApex1 = rho :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  have hwRadiusSw : dist F.pair.w Dsw.packet.oppApex1 = rho :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.w_mem_marginal).1).2
  have hqRadius : dist F.pair.q D.packet.oppApex2 = rho := by
    simpa only [hswap.toNonSurplusSwap.oppApex1_eq] using hqRadiusSw
  have hwRadius : dist F.pair.w D.packet.oppApex2 = rho := by
    simpa only [hswap.toNonSurplusSwap.oppApex1_eq] using hwRadiusSw
  have hdouble :
      HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.q).erase F.pair.w) D.packet.oppApex1 := by
    have hdoubleSw :
        HasNEquidistantPointsAt 4
          ((Dsw.A.erase F.pair.q).erase F.pair.w) D.packet.oppApex1 := by
      simpa only [hswap.oppApex2_eq] using F.secondApexDouble
    rw [hswap.toNonSurplusSwap.carrier_eq] at hdoubleSw
    exact hdoubleSw
  exact ⟨hqA, hwA, F.pair.q_ne_w, hqOff, hwOff,
    hqRadius, hwRadius, hdouble⟩

#print axioms survivorPair_dist_ne_at_swapped_firstApex
#print axioms no_same_pair_survivorPacket_after_completeSwap
#print axioms no_same_pair_criticalPairFrontier_after_completeSwap
#print axioms exists_freshCriticalPairFrontier_after_completeSwap
#print axioms exists_freshCriticalPairFrontier_at_rightOrientedIndex
#print axioms criticalPairFrontier_after_swap_physical_projection

end ATailBlockerDistinctRadiusScratch
end Problem97
