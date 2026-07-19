/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.

Scratch validation for the first source-faithful global step after the
retained frontier pair.  This file deliberately does not edit the production
parent or claim a terminal contradiction.
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.ATail.SurvivalCoverParentBoundary

/-!
This file validates the first source-faithful global step after the retained
frontier pair without editing the production parent.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierPairGlobalDeletionSplit

open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion
open ATailGlobalMinimalDeletion
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailFrontierCommonDeletionEscape
open ATailSurvivalCoverParentBoundary

attribute [local instance] Classical.propDecidable

/- The retained frontier pair admits a source-faithful minimal-deletion
   reduction.  The two possible cardinalities are kept explicit because the
   singleton arm and the pair arm require different downstream consumers. -/
theorem frontierPair_globalDeletion_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    ∃ center ∈ D.A \ ({F.pair.q, F.pair.w} : Finset ℝ²),
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆ ({F.pair.q, F.pair.w} : Finset ℝ²) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        (∀ s ∈ V,
          HasNEquidistantPointsAt 4
            (D.A \ (V.erase s)) center) ∧
        (V.card = 1 ∨
          (V.card = 2 ∧ V = ({F.pair.q, F.pair.w} : Finset ℝ²))) := by
  let U : Finset ℝ² := {F.pair.q, F.pair.w}
  have hUsub : U ⊆ D.A := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact F.pair.q_mem_A
    · have hxw : x = F.pair.w := Finset.mem_singleton.mp hx
      subst x
      exact F.pair.w_mem_A
  have hUne : U.Nonempty := ⟨F.pair.q, by simp [U]⟩
  have hUle : U.card ≤ 2 := by
    dsimp [U]
    calc
      ({F.pair.q, F.pair.w} : Finset ℝ²).card ≤
          ({F.pair.w} : Finset ℝ²).card + 1 :=
        Finset.card_insert_le F.pair.q {F.pair.w}
      _ = 2 := by simp
  have hremainingCard : 0 < (D.A \ U).card := by
    have hsplit := Finset.card_sdiff_add_card_inter D.A U
    have hinterLe : (D.A ∩ U).card ≤ 2 := by
      calc
        (D.A ∩ U).card ≤ U.card :=
          Finset.card_le_card Finset.inter_subset_right
        _ ≤ 2 := hUle
    have hAcard : 13 < D.A.card := by
      have hfourteen := L.carrier_card_ge_fourteen
      omega
    omega
  rcases exists_global_cardMinimal_blocking_subdeletion
      R.minimal (by simpa [U] using hUsub) hUne
      (by simpa [U] using Finset.card_pos.mp hremainingCard) with
    ⟨center, hcenterRemaining, V, hVne, hVsub,
      hVblocked, hVminimal⟩
  have hVle : V.card ≤ 2 :=
    le_trans (Finset.card_le_card hVsub) hUle
  have hVcard : V.card = 1 ∨ V.card = 2 := by
    have hVpos : 0 < V.card := Finset.card_pos.mpr hVne
    omega
  refine ⟨center, ?_, V, hVne, ?_, hVblocked, hVminimal, ?_⟩
  · simpa [U] using hcenterRemaining
  · simpa [U] using hVsub
  · rcases hVcard with hVone | hVtwo
    · exact Or.inl hVone
    · right
      refine ⟨hVtwo, ?_⟩
      have hUcard : U.card = 2 := by
        simp [U, F.pair.q_ne_w]
      have hVeq : V = U :=
        Finset.eq_of_subset_of_card_le hVsub (by omega)
      simpa [U] using hVeq

/- The first-step coordinator keeps the raw directed cross split, the
global deletion-critical core, and the already productionized physical
second-apex endpoint in one source-faithful packet.  This is deliberately a
normal form rather than a contradiction theorem: every field is an input to
the next parent consumer. -/
structure FrontierPairGlobalStep
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) : Type where
  center : ℝ²
  center_mem : center ∈ D.A \ ({F.pair.q, F.pair.w} : Finset ℝ²)
  V : Finset ℝ²
  V_nonempty : V.Nonempty
  V_subset : V ⊆ ({F.pair.q, F.pair.w} : Finset ℝ²)
  deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A \ V) center
  prescribed_single_deletions_survive :
    ∀ s ∈ V,
      HasNEquidistantPointsAt 4
        (D.A \ (V.erase s)) center
  core_cardinality :
    V.card = 1 ∨
      (V.card = 2 ∧ V = ({F.pair.q, F.pair.w} : Finset ℝ²))
  directed :
    Nonempty (FrontierDirectedBlockerOutcome R.common)
  endpoint :
    (SelectedClass D.A S.oppApex1 firstRadius).card = 4 ∨
      Nonempty (CommonDeletionTwoCenterPacket D H F.pair.w
        S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A)) ∨
      (Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
        Nonempty (PhysicalSecondApexCriticalResidual D S))

/-- Combine the independently checked global-minimality and cross-deletion
splits without discarding the original `L` parent packet. -/
theorem nonempty_frontierPairGlobalStep
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    Nonempty (FrontierPairGlobalStep L) := by
  rcases frontierPair_globalDeletion_split L with
    ⟨center, hcenter, V, hVne, hVsub, hblocked, hsurvives, hcard⟩
  have hdirected :
      Nonempty (FrontierDirectedBlockerOutcome R.common) :=
    nonempty_parentFrontierDirectedBlockerOutcome R
  have hendpoint :=
    exactFour_or_companionCommonDeletion_or_physicalSecondApexEndpoint L
  exact ⟨{
    center := center
    center_mem := hcenter
    V := V
    V_nonempty := hVne
    V_subset := hVsub
    deletion_blocked := hblocked
    prescribed_single_deletions_survive := hsurvives
    core_cardinality := hcard
    directed := hdirected
    endpoint := hendpoint }⟩

end ATailFrontierPairGlobalDeletionSplit
end Problem97

#print axioms Problem97.ATailFrontierPairGlobalDeletionSplit.frontierPair_globalDeletion_split
#print axioms Problem97.ATailFrontierPairGlobalDeletionSplit.nonempty_frontierPairGlobalStep
