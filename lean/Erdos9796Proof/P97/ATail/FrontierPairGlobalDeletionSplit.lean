/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion

/-!
# Global deletion split at the retained frontier pair

The retained frontier pair is the first source-faithful object after the
frontier extraction.  Global minimality therefore gives a minimal deletion
core contained in that pair.  The output is deliberately a progress surface:
the singleton and full-pair cases have different downstream consumers, so no
unjustified collapse to a common-deletion packet is made here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierPairGlobalDeletionSplit

open ATailCriticalPairFrontier
open ATailGlobalMinimalDeletion
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

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
          HasNEquidistantPointsAt
            4 (D.A \ (V.erase s)) center) ∧
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

end ATailFrontierPairGlobalDeletionSplit
end Problem97

#print axioms Problem97.ATailFrontierPairGlobalDeletionSplit.frontierPair_globalDeletion_split
