/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14SourceJobBridge
import Erdos9796Proof.P97.Census554.SinzSat

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

/-- Joint-deletion label of a frozen job. -/

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

/-- A sequence of source-wise Sinz extensions preserves a variable lying at
or below every source counter base in the sequence. -/
private theorem foldl_sourceSinz_apply_eq_of_le
    (cell : FrozenV14JobCoordinate) (indices : List (Fin 5))
    (σ : Nat → Bool) (v : Nat)
    (hv : ∀ j ∈ indices, v ≤ sourceSinzBase cell j) :
    indices.foldl
        (fun acc j => sinzExt acc (sourceBlockerVars cell j) 1
          (sourceSinzBase cell j)) σ v = σ v := by
  induction indices generalizing σ with
  | nil => rfl
  | cons j js ih =>
      rw [List.foldl_cons, ih]
      · exact Census554.CoverCnf.sinzExt_le σ
          (sourceBlockerVars cell j) 1 (sourceSinzBase cell j)
          (hv j (by simp))
      · intro q hq
        exact hv q (by simp [hq])

/-- The four later source counters preserve every variable in the first
source counter's emitted interval. -/
private theorem sourceSinzAssign_eq_local_zero_of_le
    (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) (v : Nat)
    (hv : v ≤ SafeCoverCnf.baseNumVars + 20) :
    sourceSinzAssign cell σ v =
      sinzExt σ (sourceBlockerVars cell 0) 1 (sourceSinzBase cell 0) v := by
  unfold sourceSinzAssign
  rw [show List.finRange 5 =
    ([0, 1, 2, Fin.succ 2, Fin.succ (Fin.succ 2)] : List (Fin 5)) by decide]
  rw [List.foldl_cons]
  apply foldl_sourceSinz_apply_eq_of_le
  intro j hj
  rw [sourceSinzBase_eq]
  fin_cases j <;> simp at hj ⊢ <;> omega

/-- The completed five-source fold satisfies every Sinz clause emitted for
the first source block. -/
theorem sourceSinzAssign_sat_source_zero
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (σ : Nat → Bool) {c : List Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell 0) 1
      (sourceSinzBase cell 0)) :
    evalClauseD
      (sourceSinzAssign cell (blockerAssign cell blocker σ)) c = true := by
  let σb := blockerAssign cell blocker σ
  have hcount : ((sourceBlockerVars cell 0).filter σb).length ≤ 1 := by
    rw [sourceBlockerVars_filter_blockerAssign_length cell hadded σ 0]
  have hbelow : ∀ v ∈ sourceBlockerVars cell 0,
      v ≤ sourceSinzBase cell 0 := fun v hv =>
    sourceBlockerVars_le_sourceSinzBase cell 0 hv
  have hlocal := sinz_sat σb (sourceBlockerVars cell 0) 1
    (sourceSinzBase cell 0) (by decide) hcount hbelow c hc
  rw [Census554.CoverCnf.evalClauseD_congr (σ' :=
    sinzExt σb (sourceBlockerVars cell 0) 1 (sourceSinzBase cell 0))]
  · exact hlocal
  · intro l hl
    have hbound := Census554.CoverCnf.sinzClauses_lit_bound
      (sourceBlockerVars cell 0) 1
      (sourceSinzBase cell 0) (by decide) hbelow c hc l hl
    rw [sourceSinzBase_eq, sourceBlockerVars, List.length_map,
      blockerCenters_length] at hbound
    norm_num at hbound
    exact sourceSinzAssign_eq_local_zero_of_le cell σb l.natAbs (by omega)

/-- The completed five-source fold satisfies every Sinz clause emitted for
the second source block. -/
