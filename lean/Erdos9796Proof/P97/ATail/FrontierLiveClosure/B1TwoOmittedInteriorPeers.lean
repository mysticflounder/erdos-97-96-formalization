/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion

/-!
# B1 card-six two omitted strict-interior peers

This module exposes a neutral source-clean producer for the card-six branch.
The selected physical class has at least four strict second-cap interior
members, while one actual late row meets that interior class in at most two
points.  Two distinct interior peers therefore lie outside that row, and
support equality under equal actual blockers gives the two source/peer
blocker inequalities.

This is a producer-side theorem only.  It does not select the mutually omitted
pair used by a downstream B1 collision consumer, nor does it close B1.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace B1TwoOmittedInteriorPeers

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailSurvivalCover
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}

/-- Card six supplies two distinct strict second-cap interior peers outside a
fixed source row.  Each peer has an actual blocker distinct from the source's
actual blocker. -/
theorem exists_two_omittedSecondClassInteriorPeers
    (R : OriginalUniqueFourResidual F)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hsix : 6 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2)) :
    ∃ peer₁ peer₂ : CarrierVertex D.A,
      peer₁ ≠ peer₂ ∧
      peer₁ ≠ source ∧
      peer₂ ≠ source ∧
      peer₁.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
      peer₂.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
      peer₁.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      peer₂.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      peer₁.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∧
      peer₂.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt peer₁.1 peer₁.2 ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt peer₂.1 peer₂.2 := by
  classical
  let physicalClass := SelectedClass D.A S.oppApex2 rho
  let interiorClass :=
    physicalClass ∩ S.capInteriorByIndex S.oppIndex2
  let sourceRow :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let omitted := interiorClass \ sourceRow
  have hinteriorBound :
      physicalClass.card - 2 ≤ interiorClass.card := by
    have hboundIndexed :
        (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2) rho).card - 2 ≤
          (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
            S.capInteriorByIndex S.oppIndex2).card :=
      S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
        D.convex S.oppIndex2 hrho
    have hbound :
        (SelectedClass D.A S.oppApex2 rho).card - 2 ≤
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2).card := by
      rw [oppApex2_eq_oppositeVertex_oppIndex2 S]
      exact hboundIndexed
    simpa [interiorClass, physicalClass] using hbound
  have hinteriorCard : 4 ≤ interiorClass.card := by
    have hclass : 6 ≤ physicalClass.card := by simpa [physicalClass] using hsix
    omega
  have hrowInterior : (sourceRow ∩ interiorClass).card ≤ 2 := by
    simpa [sourceRow, interiorClass, physicalClass] using hlateCross
  have hsplit : omitted.card + (interiorClass ∩ sourceRow).card =
      interiorClass.card := by
    change (interiorClass \ sourceRow).card +
        (interiorClass ∩ sourceRow).card = interiorClass.card
    exact Finset.card_sdiff_add_card_inter interiorClass sourceRow
  have homittedCard : 2 ≤ omitted.card := by
    have hcomm : (interiorClass ∩ sourceRow).card =
        (sourceRow ∩ interiorClass).card := by
      rw [Finset.inter_comm]
    omega
  obtain ⟨a, haOmitted, b, hbOmitted, hab⟩ :=
    Finset.one_lt_card.mp (show 1 < omitted.card by omega)
  have haData := Finset.mem_sdiff.mp haOmitted
  have hbData := Finset.mem_sdiff.mp hbOmitted
  have haInterior := Finset.mem_inter.mp haData.1
  have hbInterior := Finset.mem_inter.mp hbData.1
  have haA : a ∈ D.A := (mem_selectedClass.mp haInterior.1).1
  have hbA : b ∈ D.A := (mem_selectedClass.mp hbInterior.1).1
  let peer₁ : CarrierVertex D.A := ⟨a, haA⟩
  let peer₂ : CarrierVertex D.A := ⟨b, hbA⟩
  have hsourceOwn : source.1 ∈ sourceRow := by
    exact
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.q_mem_support
  have haNeSourceVal : a ≠ source.1 := by
    intro h
    apply haData.2
    simpa [sourceRow, h] using hsourceOwn
  have hbNeSourceVal : b ≠ source.1 := by
    intro h
    apply hbData.2
    simpa [sourceRow, h] using hsourceOwn
  have hpeer₁NeSource : peer₁ ≠ source := by
    intro h
    exact haNeSourceVal (congrArg Subtype.val h)
  have hpeer₂NeSource : peer₂ ≠ source := by
    intro h
    exact hbNeSourceVal (congrArg Subtype.val h)
  have hpeerNe : peer₁ ≠ peer₂ := by
    intro h
    exact hab (congrArg Subtype.val h)
  have hblocker₁ :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt peer₁.1 peer₁.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) source.2 peer₁.2 hcenters
    apply haData.2
    change a ∈
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
    rw [hsupports]
    exact
      ((lateFirstApexSystem R).selectedAt
        peer₁.1 peer₁.2).toCriticalFourShell.q_mem_support
  have hblocker₂ :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt peer₂.1 peer₂.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) source.2 peer₂.2 hcenters
    apply hbData.2
    change b ∈
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
    rw [hsupports]
    exact
      ((lateFirstApexSystem R).selectedAt
        peer₂.1 peer₂.2).toCriticalFourShell.q_mem_support
  refine ⟨peer₁, peer₂, hpeerNe, hpeer₁NeSource, hpeer₂NeSource, ?_, ?_,
    ?_, ?_, ?_, ?_, hblocker₁, hblocker₂⟩
  · simpa [peer₁, physicalClass] using haInterior.1
  · simpa [peer₂, physicalClass] using hbInterior.1
  · simpa [peer₁] using haInterior.2
  · simpa [peer₂] using hbInterior.2
  · simpa [peer₁, sourceRow] using haData.2
  · simpa [peer₂, sourceRow] using hbData.2

/-- In the `u = source` branch, a physical-class endpoint outside the strict
second cap cannot contain both omitted interior peers in its actual row.  The
two-point row bound therefore couples one peer to both the source row and the
endpoint row. -/
theorem exists_coupled_omittedSecondClassInteriorPeer
    (R : OriginalUniqueFourResidual F)
    (source v : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hsix : 6 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvNotInterior : v.1 ∉ S.capInteriorByIndex S.oppIndex2)
    (hvRowCross :
      ((((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card ≤ 2)) :
    ∃ peer : CarrierVertex D.A,
      peer ≠ source ∧
      peer ≠ v ∧
      peer.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
      peer.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      peer.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∧
      peer.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt peer.1 peer.2 := by
  classical
  let physicalClass := SelectedClass D.A S.oppApex2 rho
  let sourceRow :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let endpointRow :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support
  obtain ⟨peer₁, peer₂, hpeerNe, hpeer₁Source, hpeer₂Source,
      hpeer₁Class, hpeer₂Class, hpeer₁Interior, hpeer₂Interior,
      hpeer₁SourceRow, hpeer₂SourceRow, hblocker₁, hblocker₂⟩ :=
    exists_two_omittedSecondClassInteriorPeers R source hrho hsix hlateCross
  have hpeer₁NeV : peer₁ ≠ v := by
    intro h
    apply hvNotInterior
    exact h ▸ hpeer₁Interior
  have hpeer₂NeV : peer₂ ≠ v := by
    intro h
    apply hvNotInterior
    exact h ▸ hpeer₂Interior
  have hpeer₁NeVVal : peer₁.1 ≠ v.1 := by
    intro h
    exact hpeer₁NeV (Subtype.ext h)
  have hpeer₂NeVVal : peer₂.1 ≠ v.1 := by
    intro h
    exact hpeer₂NeV (Subtype.ext h)
  have hpeer₁Ne₂Val : peer₁.1 ≠ peer₂.1 := by
    intro h
    exact hpeerNe (Subtype.ext h)
  have hvOwn : v.1 ∈ endpointRow := by
    exact
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  have hvMem : v.1 ∈ endpointRow ∩ physicalClass := by
    exact Finset.mem_inter.mpr ⟨hvOwn, by simpa [physicalClass] using hvClass⟩
  by_cases hpeer₁Not : peer₁.1 ∉ endpointRow
  · exact ⟨peer₁, hpeer₁Source, hpeer₁NeV, hpeer₁Class,
      hpeer₁Interior, hpeer₁SourceRow, hpeer₁Not, hblocker₁⟩
  · have hpeer₁Endpoint : peer₁.1 ∈ endpointRow := not_not.mp hpeer₁Not
    have hpeer₂Not : peer₂.1 ∉ endpointRow := by
      intro hpeer₂Endpoint
      have hpeer₁Mem' : peer₁.1 ∈ endpointRow ∩ physicalClass := by
        exact Finset.mem_inter.mpr ⟨hpeer₁Endpoint,
          by simpa [physicalClass] using hpeer₁Class⟩
      have hpeer₂Mem' : peer₂.1 ∈ endpointRow ∩ physicalClass := by
        exact Finset.mem_inter.mpr ⟨hpeer₂Endpoint,
          by simpa [physicalClass] using hpeer₂Class⟩
      have hthreeSubset :
          ({v.1, peer₁.1, peer₂.1} : Finset ℝ²) ⊆
            endpointRow ∩ physicalClass := by
        intro x hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hx
        rcases hx with rfl | rfl | rfl
        · exact hvMem
        · exact hpeer₁Mem'
        · exact hpeer₂Mem'
      have hthreeCard :
          ({v.1, peer₁.1, peer₂.1} : Finset ℝ²).card = 3 := by
        exact Finset.card_eq_three.mpr
          ⟨v.1, peer₁.1, peer₂.1, Ne.symm hpeer₁NeVVal,
            Ne.symm hpeer₂NeVVal, hpeer₁Ne₂Val, rfl⟩
      have hthreeLe := Finset.card_le_card hthreeSubset
      have hrowBound : (endpointRow ∩ physicalClass).card ≤ 2 := by
        simpa [endpointRow, physicalClass] using hvRowCross
      rw [hthreeCard] at hthreeLe
      omega
    exact ⟨peer₂, hpeer₂Source, hpeer₂NeV, hpeer₂Class,
      hpeer₂Interior, hpeer₂SourceRow, hpeer₂Not, hblocker₂⟩

end B1TwoOmittedInteriorPeers
end ATailFrontierLiveClosure
end Problem97
