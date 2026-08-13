/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14SourceJobBridge
import Erdos9796Proof.P97.Census554.SinzSat
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step_01
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step02.Part_01

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

/-- Injectivity of the semantic blocker function makes every center-wise
blocker-input block satisfy its at-most-one premise. -/
theorem centerBlockerVars_filter_blockerAssign_length_le_one
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (σ : Nat → Bool) (center : Nat) :
    ((centerBlockerVars cell center).filter
      (blockerAssign cell blocker σ)).length ≤ 1 := by
  have hinjective : Function.Injective blocker := hadded.2.2.1
  have hnd : ((centerBlockerVars cell center).filter
      (blockerAssign cell blocker σ)).Nodup :=
    (centerBlockerVars_nodup cell center).filter _
  by_cases hexists : ∃ i : Fin 5,
      center ∈ blockerCenters ((physicalSources cell).getD i.val 0) ∧
        center = (blocker i).val
  · obtain ⟨i, hic, hblockerI⟩ := hexists
    apply SafeCoverCnf.length_le_one_of_all_eq hnd
    intro x hx
    rw [List.mem_filter] at hx
    obtain ⟨hxCenter, hxTrue⟩ := hx
    unfold centerBlockerVars at hxCenter
    rw [List.mem_filterMap] at hxCenter
    obtain ⟨j, _hj, hjOption⟩ := hxCenter
    simp at hjOption
    obtain ⟨hjc, hjVar⟩ := hjOption
    subst x
    have hblockerJ :=
      (blockerAssign_blockerVar_eq_true_iff cell hadded σ j hjc).1 hxTrue
    have hji : j = i := by
      apply hinjective
      apply Fin.ext
      rw [← hblockerJ, ← hblockerI]
    subst j
    rfl
  · apply SafeCoverCnf.length_le_one_of_all_eq hnd
      (a := 0)
    intro x hx
    rw [List.mem_filter] at hx
    obtain ⟨hxCenter, hxTrue⟩ := hx
    unfold centerBlockerVars at hxCenter
    rw [List.mem_filterMap] at hxCenter
    obtain ⟨i, _hi, hiOption⟩ := hxCenter
    simp at hiOption
    obtain ⟨hic, hiVar⟩ := hiOption
    subst x
    have hblockerI :=
      (blockerAssign_blockerVar_eq_true_iff cell hadded σ i hic).1 hxTrue
    exact (hexists ⟨i, hic, hblockerI⟩).elim

/-- Extend the blocker valuation through the five source-wise bound-one Sinz
blocks, in compiler allocation order. -/
def sourceSinzAssign (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) :
    Nat → Bool :=
  (List.finRange 5).foldl
    (fun acc i =>
      sinzExt acc (sourceBlockerVars cell i) 1 (sourceSinzBase cell i)) σ

/-- A Sinz extension also agrees with its input assignment strictly above the
auxiliary interval. -/
theorem sinzExt_gt (σ : Nat → Bool) (xs : List Nat) (k base v : Nat)
    (hv : base + k * xs.length < v) :
    sinzExt σ xs k base v = σ v := by
  unfold sinzExt
  rw [if_neg]
  omega

/-- A completed earlier source counter lies strictly below every blocker input
of a later source block. -/
theorem sourceSinzEnd_lt_blockerVar_of_lt (cell : FrozenV14JobCoordinate)
    {i j : Fin 5} (hji : j.val < i.val) {center : Nat}
    (hcenter : center ∈
      blockerCenters ((physicalSources cell).getD i.val 0)) :
    sourceSinzBase cell j + (sourceBlockerVars cell j).length <
      blockerVar cell i center := by
  rw [sourceSinzEnd_eq]
  have hbounds := (blockerVar_bounds_of_mem cell i hcenter).1
  omega

/-- Extending an earlier source counter leaves every later source input
unchanged. -/
theorem sinzExt_sourceBlockerVar_of_lt (cell : FrozenV14JobCoordinate)
    (σ : Nat → Bool) {i j : Fin 5} (hji : j.val < i.val) {v : Nat}
    (hv : v ∈ sourceBlockerVars cell i) :
    sinzExt σ (sourceBlockerVars cell j) 1 (sourceSinzBase cell j) v = σ v := by
  simp only [sourceBlockerVars, List.mem_map] at hv
  obtain ⟨center, hcenter, rfl⟩ := hv
  apply sinzExt_gt
  simpa using sourceSinzEnd_lt_blockerVar_of_lt cell hji hcenter

/-- The fixed five-source fold unfolds to the compiler's five extensions in
source order. -/
theorem sourceSinzAssign_eq_chain (cell : FrozenV14JobCoordinate)
    (σ : Nat → Bool) :
    sourceSinzAssign cell σ =
      sinzExt
        (sinzExt
          (sinzExt
            (sinzExt
              (sinzExt σ (sourceBlockerVars cell 0) 1
                (sourceSinzBase cell 0))
              (sourceBlockerVars cell 1) 1 (sourceSinzBase cell 1))
            (sourceBlockerVars cell 2) 1 (sourceSinzBase cell 2))
          (sourceBlockerVars cell (Fin.succ 2)) 1
            (sourceSinzBase cell (Fin.succ 2)))
        (sourceBlockerVars cell (Fin.succ (Fin.succ 2))) 1
          (sourceSinzBase cell (Fin.succ (Fin.succ 2))) := by
  rfl

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
