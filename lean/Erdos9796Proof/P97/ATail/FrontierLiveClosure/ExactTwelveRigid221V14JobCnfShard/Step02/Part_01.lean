/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14SourceJobBridge
import Erdos9796Proof.P97.Census554.SinzSat
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step_01

/-!
# Exact variable layout for normalized-v14 jobs

This module mirrors the auxiliary-variable allocation performed by
`census/card_head/exact12_v14_valuation.py`.  Starting at the frozen
source-faithful base-CNF counter, the compiler allocates five blocks of ten
blocker variables and ten bound-one Sinz variables, followed by the
center-wise bound-one Sinz blocks.

The definitions below are the proof-facing variable-map contract.  They do
not yet claim that the complete emitted clause list is satisfied or that any
terminal journal covers the 648 jobs.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14JobCnf

open Census554.CoverCnf
open Census554.EqualityCore
open SafeCoverCnf
open ExactTwelveCarrierIngress

/-- The five blocker variables selected by a semantic blocker function. -/
def selectedBlockerVars (cell : FrozenV14JobCoordinate)
    (blocker : Fin 5 → Label) : List Nat :=
  (List.finRange 5).map fun i => blockerVar cell i (blocker i).val

/-- Extend a base assignment across the blocker inputs.  Every allocated
blocker variable is false except for the one selected by each of the five
semantic physical sources. -/
def blockerAssign (cell : FrozenV14JobCoordinate) (blocker : Fin 5 → Label)
    (σ : Nat → Bool) : Nat → Bool :=
  fun v =>
    if v ∈ allBlockerVars cell then
      decide (v ∈ selectedBlockerVars cell blocker)
    else σ v

/-- On an allocated source input, the blocker extension is true exactly at
the semantically selected center for that source. -/
theorem blockerAssign_blockerVar_eq_true_iff
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (σ : Nat → Bool) (i : Fin 5) {center : Nat}
    (hcenter : center ∈
      blockerCenters ((physicalSources cell).getD i.val 0)) :
    blockerAssign cell blocker σ (blockerVar cell i center) = true ↔
      center = (blocker i).val := by
  have hall : blockerVar cell i center ∈ allBlockerVars cell := by
    simp only [allBlockerVars, List.mem_flatMap, List.mem_finRange,
      sourceBlockerVars, List.mem_map]
    exact ⟨i, trivial, center, hcenter, rfl⟩
  rw [blockerAssign, if_pos hall]
  simp only [decide_eq_true_eq, selectedBlockerVars, List.mem_map,
    List.mem_finRange]
  constructor
  · rintro ⟨j, _hj, hvar⟩
    have hjcenter :=
      blocker_mem_blockerCenters_of_addedConstraints cell hadded j
    have hij := blockerVar_injective_across_sources cell hcenter hjcenter
      hvar.symm
    simpa [hij.1] using hij.2
  · intro hcenterEq
    subst center
    exact ⟨i, trivial, rfl⟩

/-- Each source block contains exactly one true blocker input under the
semantic assignment. -/
theorem sourceBlockerVars_filter_blockerAssign_length
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (σ : Nat → Bool) (i : Fin 5) :
    ((sourceBlockerVars cell i).filter
      (blockerAssign cell blocker σ)).length = 1 := by
  let selected := blockerVar cell i (blocker i).val
  have hselectedCenter :=
    blocker_mem_blockerCenters_of_addedConstraints cell hadded i
  have hselectedMem : selected ∈
      (sourceBlockerVars cell i).filter (blockerAssign cell blocker σ) := by
    rw [List.mem_filter]
    refine ⟨?_, ?_⟩
    · exact List.mem_map.mpr ⟨(blocker i).val, hselectedCenter, rfl⟩
    · exact (blockerAssign_blockerVar_eq_true_iff cell hadded σ i
        hselectedCenter).2 rfl
  have hnd : ((sourceBlockerVars cell i).filter
      (blockerAssign cell blocker σ)).Nodup :=
    (sourceBlockerVars_nodup cell i).filter _
  have hallEq : ∀ x ∈ (sourceBlockerVars cell i).filter
      (blockerAssign cell blocker σ), x = selected := by
    intro x hx
    rw [List.mem_filter] at hx
    obtain ⟨hxSource, hxTrue⟩ := hx
    simp only [sourceBlockerVars, List.mem_map] at hxSource
    obtain ⟨center, hcenter, rfl⟩ := hxSource
    have hcenterEq :=
      (blockerAssign_blockerVar_eq_true_iff cell hadded σ i hcenter).1 hxTrue
    subst center
    rfl
  have hle := SafeCoverCnf.length_le_one_of_all_eq hnd hallEq
  have hpos := (List.idxOf_lt_length_iff (l :=
    (sourceBlockerVars cell i).filter
      (blockerAssign cell blocker σ))).2 hselectedMem
  omega

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
