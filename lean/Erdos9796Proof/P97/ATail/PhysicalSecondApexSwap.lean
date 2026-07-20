/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.PhysicalSecondApexCommonDeletion

/-!
# Reorienting a physical-second-apex critical shell

A prescribed critical shell at the physical second apex becomes a protected
first-apex unique-card-four frontier after swapping the two non-surplus roles.
The construction is packet-generic and preserves the carrier and surplus cap.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPhysicalSecondApexSwap

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

private noncomputable def withPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    CounterexampleData := {
  A := D.A
  nonempty := D.nonempty
  convex := D.convex
  K4 := D.K4
  packet := S }

private theorem transported_oppApex1
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).oppApex1 = S.oppApex1 := by subst B; rfl

private theorem transported_oppApex2
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).oppApex2 = S.oppApex2 := by subst B; rfl

private theorem transported_oppCap1
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).oppCap1 = S.oppCap1 := by subst B; rfl

private theorem transported_oppCap2
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).oppCap2 = S.oppCap2 := by subst B; rfl

private theorem transported_surplusCap
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).surplusCap = S.surplusCap := by subst B; rfl

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi]
      using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi]
      using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.oppApex1, hi]
      using S.partition.v1_mem_C3

private theorem oppApex1_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2, SurplusCapPacket.oppApex1, hi]
      using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppCap2, SurplusCapPacket.oppApex1, hi]
      using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppCap2, SurplusCapPacket.oppApex1, hi]
      using S.partition.v1_mem_C2

private theorem nonSurplusSwap_oppApex2_eq
    {D Dsw : CounterexampleData}
    (hswap : U2NonSurplusSqueeze.NonSurplusSwap D Dsw) :
    Dsw.packet.oppApex2 = D.packet.oppApex1 := by
  have hsurplus : D.packet.oppApex1 ∈ Dsw.packet.surplusCap := by
    rw [hswap.surplusCap_eq]
    exact oppApex1_mem_surplusCap D.packet
  have hcap : D.packet.oppApex1 ∈ Dsw.packet.oppCap1 := by
    rw [hswap.oppCap1_eq]
    exact oppApex1_mem_oppCap2 D.packet
  have hsingleton := U2NonSurplusSqueeze.surplus_inter_oppCap1_subset_oppApex2
    Dsw (Finset.mem_inter.mpr ⟨hsurplus, hcap⟩)
  exact (Finset.mem_singleton.mp hsingleton).symm

/-- A blocked prescribed deletion makes its critical-shell radius the only
positive ambient radius with four points at that center. -/
private theorem criticalRadius_unique_of_blocked
    {A : Finset ℝ²} {z center : ℝ²}
    (C : CriticalSelectedFourClass A z center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase z) center)
    {tau : ℝ} (htau : 0 < tau)
    (hfour : 4 ≤ (SelectedClass A center tau).card) :
    tau = C.toCriticalFourShell.radius := by
  have hzClass : z ∈ SelectedClass A center tau := by
    by_contra hzClass
    apply hblocked
    refine ⟨tau, htau, ?_⟩
    change 4 ≤ (SelectedClass (A.erase z) center tau).card
    rw [selectedClass_erase_card_eq_of_not_mem hzClass]
    exact hfour
  calc
    tau = dist center z := (mem_selectedClass.mp hzClass).2.symm
    _ = C.toCriticalFourShell.radius :=
      C.toCriticalFourShell.support_eq_radius
        z C.toCriticalFourShell.q_mem_support

/-- A fresh swapped frontier carrying the exact protected unique-four fields. -/
structure SwappedFirstApexUniqueFourFrontier
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Type where
  packet : SurplusCapPacket D.A
  firstApex_eq : packet.oppApex1 = S.oppApex2
  secondApex_eq : packet.oppApex2 = S.oppApex1
  firstCap_eq : packet.oppCap1 = S.oppCap2
  secondCap_eq : packet.oppCap2 = S.oppCap1
  surplusCap_eq : packet.surplusCap = S.surplusCap
  radius : ℝ
  radius_pos : 0 < radius
  frontier : CriticalPairFrontier D packet radius H
  firstClass_card_eq_four :
    (SelectedClass D.A packet.oppApex1 radius).card = 4
  firstClass_unique_radius : ∀ tau : ℝ, 0 < tau →
    4 ≤ (SelectedClass D.A packet.oppApex1 tau).card → tau = radius
  firstApexDouble_blocked : ¬ HasNEquidistantPointsAt 4
    ((D.A.erase frontier.pair.q).erase frontier.pair.w) packet.oppApex1

private theorem pair_q_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hq, _⟩
  rcases Finset.mem_filter.mp hq with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

private theorem pair_w_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hw, _⟩
  rcases Finset.mem_filter.mp hw with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr ⟨hwA, by simpa only [dist_comm] using hwRadius⟩

private theorem firstApexDouble_blocked_of_unique_card_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hunique : ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass D.A S.oppApex1 tau).card → tau = radius) :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1 := by
  rintro ⟨tau, htau, hfour⟩
  have herased : 4 ≤ (SelectedClass ((D.A.erase F.pair.q).erase F.pair.w)
      S.oppApex1 tau).card := by simpa [SelectedClass] using hfour
  have hambient : 4 ≤ (SelectedClass D.A S.oppApex1 tau).card := by
    rw [selectedClass_erase_eq, selectedClass_erase_eq] at herased
    exact herased.trans (Finset.card_le_card
      ((Finset.erase_subset _ _).trans (Finset.erase_subset _ _)))
  have htauEq := hunique tau htau hambient
  subst tau
  have hwAfterQ : F.pair.w ∈ (SelectedClass D.A S.oppApex1 radius).erase F.pair.q :=
    Finset.mem_erase.mpr ⟨F.pair.q_ne_w.symm, pair_w_mem_firstClass F⟩
  rw [selectedClass_erase_eq, selectedClass_erase_eq,
    Finset.card_erase_of_mem hwAfterQ,
    Finset.card_erase_of_mem (pair_q_mem_firstClass F), hcard] at herased
  omega

/-- A critical physical-second-apex deletion reorients to a swapped protected
first-apex unique-four frontier. -/
theorem physicalSecondCritical_reorients_to_swappedUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {z : ℝ²}
    (C : CriticalSelectedFourClass D.A z S.oppApex2)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2) :
    Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  let Dleaf := withPacket D S
  obtain ⟨Dsw, hswap⟩ := U2NonSurplusSqueeze.exists_nonSurplusSwap Dleaf
  let Ssw : SurplusCapPacket D.A := hswap.carrier_eq ▸ Dsw.packet
  have hfirst : Ssw.oppApex1 = S.oppApex2 := by
    calc Ssw.oppApex1 = Dsw.packet.oppApex1 := transported_oppApex1 hswap.carrier_eq Dsw.packet
         _ = Dleaf.packet.oppApex2 := hswap.oppApex1_eq
         _ = S.oppApex2 := rfl
  have hsecond : Ssw.oppApex2 = S.oppApex1 := by
    calc Ssw.oppApex2 = Dsw.packet.oppApex2 := transported_oppApex2 hswap.carrier_eq Dsw.packet
         _ = Dleaf.packet.oppApex1 := nonSurplusSwap_oppApex2_eq hswap
         _ = S.oppApex1 := rfl
  have hcap1 : Ssw.oppCap1 = S.oppCap2 := by
    calc Ssw.oppCap1 = Dsw.packet.oppCap1 := transported_oppCap1 hswap.carrier_eq Dsw.packet
         _ = Dleaf.packet.oppCap2 := hswap.oppCap1_eq
         _ = S.oppCap2 := rfl
  have hcap2 : Ssw.oppCap2 = S.oppCap1 := by
    calc Ssw.oppCap2 = Dsw.packet.oppCap2 := transported_oppCap2 hswap.carrier_eq Dsw.packet
         _ = Dleaf.packet.oppCap1 := hswap.oppCap2_eq
         _ = S.oppCap1 := rfl
  have hsurplus : Ssw.surplusCap = S.surplusCap := by
    calc
      Ssw.surplusCap = Dsw.packet.surplusCap :=
        transported_surplusCap hswap.carrier_eq Dsw.packet
      _ = Dleaf.packet.surplusCap := hswap.surplusCap_eq
      _ = S.surplusCap := rfl
  obtain ⟨radius, hradius, hfour, ⟨F⟩⟩ := exists_criticalPairFrontier_of_K4 D Ssw H
  have hradiusEq : radius = C.toCriticalFourShell.radius :=
    criticalRadius_unique_of_blocked C hblocked hradius (by simpa only [hfirst] using hfour)
  have hcriticalCard : (SelectedClass D.A S.oppApex2 C.toCriticalFourShell.radius).card = 4 := by
    simpa [SelectedClass, C.toCriticalFourShell.support_eq] using C.toCriticalFourShell.support_card
  have hcard : (SelectedClass D.A Ssw.oppApex1 radius).card = 4 := by
    simpa only [hfirst, hradiusEq] using hcriticalCard
  have hunique : ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass D.A Ssw.oppApex1 tau).card → tau = radius := by
    intro tau htau hfourTau
    exact (criticalRadius_unique_of_blocked C hblocked htau
      (by simpa only [hfirst] using hfourTau)).trans hradiusEq.symm
  exact ⟨{
    packet := Ssw
    firstApex_eq := hfirst
    secondApex_eq := hsecond
    firstCap_eq := hcap1
    secondCap_eq := hcap2
    surplusCap_eq := hsurplus
    radius := radius
    radius_pos := hradius
    frontier := F
    firstClass_card_eq_four := hcard
    firstClass_unique_radius := hunique
    firstApexDouble_blocked :=
      firstApexDouble_blocked_of_unique_card_four F hcard hunique
  }⟩

end ATailPhysicalSecondApexSwap
end Problem97
