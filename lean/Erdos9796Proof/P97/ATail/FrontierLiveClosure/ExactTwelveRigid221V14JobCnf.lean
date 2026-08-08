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
def jointDeletion (cell : FrozenV14JobCoordinate) : Nat :=
  (cell.1.1 : Label × Label).1.val

/-- `v` label of a frozen job. -/
def vLabel (cell : FrozenV14JobCoordinate) : Nat :=
  (cell.1.1 : Label × Label).2.val

/-- Physical sources in the exact insertion order of the Python compiler. -/
def physicalSources (cell : FrozenV14JobCoordinate) : List Nat :=
  [6, 9, jointDeletion cell, vLabel cell, 8]

/-- The numbered source list is exactly the value projection of the semantic
five-source vector. -/
theorem physicalSources_getD_eq_frozen (cell : FrozenV14JobCoordinate)
    (i : Fin 5) :
    (physicalSources cell).getD i.val 0 =
      (frozenPhysicalSources
        (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2 i).val := by
  fin_cases i <;>
    simp [physicalSources, jointDeletion, vLabel, frozenPhysicalSources]

/-- The blocker-center domain for one source: all twelve labels except the
source and the fixed second-apex label `1`, in increasing order. -/
def blockerCenters (source : Nat) : List Nat :=
  (List.range 12).filter fun center => center != source && center != 1

/-- Number of variables allocated by one source block, including its Sinz
auxiliaries. -/
def sourceBlockWidth (cell : FrozenV14JobCoordinate) (i : Fin 5) : Nat :=
  let m := (blockerCenters ((physicalSources cell).getD i.val 0)).length
  m + sinzVarCount m 1

/-- Variable counter before source block `i`. -/
def sourceBlockBase (cell : FrozenV14JobCoordinate) (i : Fin 5) : Nat :=
  SafeCoverCnf.baseNumVars +
    (((List.finRange 5).take i.val).map fun j =>
      sourceBlockWidth cell j).sum

/-- Exact DIMACS variable assigned to `(source-index, blocker-center)`. -/
def blockerVar (cell : FrozenV14JobCoordinate) (i : Fin 5)
    (center : Nat) : Nat :=
  sourceBlockBase cell i +
    (blockerCenters ((physicalSources cell).getD i.val 0)).idxOf center + 1

/-- Blocker variables supplied to the source-wise at-most-one counter. -/
def sourceBlockerVars (cell : FrozenV14JobCoordinate) (i : Fin 5) : List Nat :=
  (blockerCenters ((physicalSources cell).getD i.val 0)).map
    (blockerVar cell i)

/-- Counter base after allocating the ten blocker inputs of source `i`. -/
def sourceSinzBase (cell : FrozenV14JobCoordinate) (i : Fin 5) : Nat :=
  sourceBlockBase cell i + (sourceBlockerVars cell i).length

/-- Counter after all five source-wise blocker/Sinz blocks. -/
def sourceBlocksEnd (cell : FrozenV14JobCoordinate) : Nat :=
  SafeCoverCnf.baseNumVars +
    ((List.finRange 5).map fun i => sourceBlockWidth cell i).sum

/-- Blocker variables terminating at one fixed center, in physical-source
insertion order. -/
def centerBlockerVars (cell : FrozenV14JobCoordinate) (center : Nat) : List Nat :=
  (List.finRange 5).filterMap fun i =>
    if center ∈ blockerCenters ((physicalSources cell).getD i.val 0) then
      some (blockerVar cell i center)
    else none

/-- Variable counter before the center-wise Sinz block at `center`. -/
def centerSinzBase (cell : FrozenV14JobCoordinate) (center : Nat) : Nat :=
  sourceBlocksEnd cell +
    ((List.range center).map fun c =>
      sinzVarCount (centerBlockerVars cell c).length 1).sum

/-- Final variable counter after all twelve center-wise Sinz blocks. -/
def finalNumVars (cell : FrozenV14JobCoordinate) : Nat :=
  sourceBlocksEnd cell +
    ((List.range 12).map fun center =>
      sinzVarCount (centerBlockerVars cell center).length 1).sum

/-- Every scheduled physical source has exactly ten blocker candidates. -/
theorem blockerCenters_length (cell : FrozenV14JobCoordinate) (i : Fin 5) :
    (blockerCenters ((physicalSources cell).getD i.val 0)).length = 10 := by
  revert cell i
  set_option maxRecDepth 100000 in
    native_decide

/-- Every source block has the compiler's fixed width `10 + 10`. -/
theorem sourceBlockWidth_eq (cell : FrozenV14JobCoordinate) (i : Fin 5) :
    sourceBlockWidth cell i = 20 := by
  rw [sourceBlockWidth, blockerCenters_length]
  decide

/-- Closed form of the source-block counter. -/
theorem sourceBlockBase_eq (cell : FrozenV14JobCoordinate) (i : Fin 5) :
    sourceBlockBase cell i = SafeCoverCnf.baseNumVars + 20 * i.val := by
  fin_cases i <;> simp [sourceBlockBase, sourceBlockWidth_eq]

/-- Closed form of the source-wise Sinz base. -/
theorem sourceSinzBase_eq (cell : FrozenV14JobCoordinate) (i : Fin 5) :
    sourceSinzBase cell i = SafeCoverCnf.baseNumVars + 20 * i.val + 10 := by
  rw [sourceSinzBase, sourceBlockBase_eq, sourceBlockerVars, List.length_map,
    blockerCenters_length]

/-- Closed form of the end of one source-wise auxiliary block. -/
theorem sourceSinzEnd_eq (cell : FrozenV14JobCoordinate) (i : Fin 5) :
    sourceSinzBase cell i + (sourceBlockerVars cell i).length =
      SafeCoverCnf.baseNumVars + 20 * i.val + 20 := by
  rw [sourceSinzBase_eq, sourceBlockerVars, List.length_map,
    blockerCenters_length]

/-- A blocker variable belonging to source block `i` lies in the ten-input
interval of that block. -/
theorem blockerVar_bounds_of_mem (cell : FrozenV14JobCoordinate) (i : Fin 5)
    {center : Nat}
    (hcenter : center ∈
      blockerCenters ((physicalSources cell).getD i.val 0)) :
    SafeCoverCnf.baseNumVars + 20 * i.val < blockerVar cell i center ∧
      blockerVar cell i center ≤
        SafeCoverCnf.baseNumVars + 20 * i.val + 10 := by
  have hidx := (List.idxOf_lt_length_iff (l :=
    blockerCenters ((physicalSources cell).getD i.val 0))).2 hcenter
  rw [blockerCenters_length] at hidx
  rw [blockerVar, sourceBlockBase_eq]
  omega

/-- Every source input lies at or below the base of its source-wise Sinz
counter. -/
theorem blockerVar_le_sourceSinzBase (cell : FrozenV14JobCoordinate)
    (i : Fin 5) {center : Nat}
    (hcenter : center ∈
      blockerCenters ((physicalSources cell).getD i.val 0)) :
    blockerVar cell i center ≤ sourceSinzBase cell i := by
  have hbounds := blockerVar_bounds_of_mem cell i hcenter
  rw [sourceSinzBase_eq]
  omega

/-- All ten inputs of a source-wise counter lie below its auxiliary base. -/
theorem sourceBlockerVars_le_sourceSinzBase (cell : FrozenV14JobCoordinate)
    (i : Fin 5) {v : Nat} (hv : v ∈ sourceBlockerVars cell i) :
    v ≤ sourceSinzBase cell i := by
  simp only [sourceBlockerVars, List.mem_map] at hv
  obtain ⟨center, hcenter, rfl⟩ := hv
  exact blockerVar_le_sourceSinzBase cell i hcenter

/-- Distinct admissible centers of one source receive distinct DIMACS
variables. -/
theorem blockerVar_injective_on (cell : FrozenV14JobCoordinate) (i : Fin 5)
    {a b : Nat}
    (ha : a ∈ blockerCenters ((physicalSources cell).getD i.val 0))
    (_hb : b ∈ blockerCenters ((physicalSources cell).getD i.val 0))
    (hvar : blockerVar cell i a = blockerVar cell i b) :
    a = b := by
  have hidx :
      (blockerCenters ((physicalSources cell).getD i.val 0)).idxOf a =
        (blockerCenters ((physicalSources cell).getD i.val 0)).idxOf b := by
    simp only [blockerVar] at hvar
    omega
  exact (List.idxOf_inj ha).mp hidx

/-- The ten blocker inputs allocated to one source are duplicate-free. -/
theorem sourceBlockerVars_nodup (cell : FrozenV14JobCoordinate) (i : Fin 5) :
    (sourceBlockerVars cell i).Nodup := by
  unfold sourceBlockerVars
  apply List.Nodup.map_on
  · intro a ha b hb hab
    exact blockerVar_injective_on cell i ha hb hab
  · exact (List.nodup_range (n := 12)).filter _

/-- The semantically selected blocker is an admissible input of its source
block. -/
theorem blocker_mem_blockerCenters_of_addedConstraints
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1) (i : Fin 5) :
    (blocker i).val ∈
      blockerCenters ((physicalSources cell).getD i.val 0) := by
  rcases hadded with
    ⟨_hrowOne, _hrowSeven, _hinjective, _hblockerU, _hblockerXv,
      hneSource, hneOne, _hrowTrace, _harm, _hd⟩
  simp only [blockerCenters, List.mem_filter, List.mem_range,
    Bool.and_eq_true, bne_iff_ne]
  refine ⟨(blocker i).isLt, ?_, ?_⟩
  · intro hval
    apply hneSource i
    apply Fin.ext
    rw [← physicalSources_getD_eq_frozen cell i]
    exact hval
  · intro hval
    apply hneOne i
    apply Fin.ext
    exact hval

/-- Source blocker-input intervals are disjoint.  Thus equality of allocated
input variables recovers both the source index and center. -/
theorem blockerVar_injective_across_sources
    (cell : FrozenV14JobCoordinate) {i j : Fin 5} {a b : Nat}
    (ha : a ∈ blockerCenters ((physicalSources cell).getD i.val 0))
    (hb : b ∈ blockerCenters ((physicalSources cell).getD j.val 0))
    (hvar : blockerVar cell i a = blockerVar cell j b) :
    i = j ∧ a = b := by
  have hia := blockerVar_bounds_of_mem cell i ha
  have hjb := blockerVar_bounds_of_mem cell j hb
  have hijVal : i.val = j.val := by omega
  have hij : i = j := Fin.ext hijVal
  subst j
  exact ⟨rfl, blockerVar_injective_on cell i ha hb hvar⟩

/-- Blocker inputs terminating at one center are duplicate-free. -/
theorem centerBlockerVars_nodup (cell : FrozenV14JobCoordinate) (center : Nat) :
    (centerBlockerVars cell center).Nodup := by
  unfold centerBlockerVars
  apply (List.nodup_finRange 5).filterMap
  intro i j v hi hj
  split at hi
  next hic =>
    split at hj
    next hjc =>
      simp only [Option.mem_some_iff] at hi hj
      exact (blockerVar_injective_across_sources cell hic hjc
        (hi.trans hj.symm)).1
    next => simp at hj
  next => simp at hi

/- ## Canonical satisfying-assignment candidate -/

/-- All fifty blocker variables, in source-block allocation order. -/
def allBlockerVars (cell : FrozenV14JobCoordinate) : List Nat :=
  (List.finRange 5).flatMap (sourceBlockerVars cell)

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
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
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
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
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
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
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
  funext v
  norm_num [sourceSinzAssign, List.finRange]

/-- The completed five-source fold satisfies every Sinz clause emitted for
the first source block. -/
theorem sourceSinzAssign_sat_source_zero
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
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
  rw [sourceSinzAssign_eq_chain]
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
    have hbound0 : l.natAbs ≤ SafeCoverCnf.baseNumVars + 20 := by
      omega
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _ (show l.natAbs ≤
        sourceSinzBase cell (Fin.succ (Fin.succ 2)) by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 20 := hbound0
        _ ≤ sourceSinzBase cell (Fin.succ (Fin.succ 2)) := by
          rw [sourceSinzBase_eq]
          norm_num)]
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _ (show l.natAbs ≤
        sourceSinzBase cell (Fin.succ 2) by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 20 := hbound0
        _ ≤ sourceSinzBase cell (Fin.succ 2) := by
          rw [sourceSinzBase_eq]
          norm_num)]
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _
      (show l.natAbs ≤ sourceSinzBase cell 2 by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 20 := hbound0
        _ ≤ sourceSinzBase cell 2 := by
          rw [sourceSinzBase_eq]
          norm_num)]
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _
      (show l.natAbs ≤ sourceSinzBase cell 1 by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 20 := hbound0
        _ ≤ sourceSinzBase cell 1 := by
          rw [sourceSinzBase_eq]
          norm_num)]

/-- The completed five-source fold satisfies every Sinz clause emitted for
the second source block. -/
theorem sourceSinzAssign_sat_source_one
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
    (σ : Nat → Bool) {c : List Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell 1) 1
      (sourceSinzBase cell 1)) :
    evalClauseD
      (sourceSinzAssign cell (blockerAssign cell blocker σ)) c = true := by
  let σb := blockerAssign cell blocker σ
  let σ0 := sinzExt σb (sourceBlockerVars cell 0) 1
    (sourceSinzBase cell 0)
  have hfilter : (sourceBlockerVars cell 1).filter σ0 =
      (sourceBlockerVars cell 1).filter σb := by
    apply List.filter_congr
    intro v hv
    exact sinzExt_sourceBlockerVar_of_lt cell σb (by decide) hv
  have hcount : ((sourceBlockerVars cell 1).filter σ0).length ≤ 1 := by
    rw [hfilter,
      sourceBlockerVars_filter_blockerAssign_length cell hadded σ 1]
  have hbelow : ∀ v ∈ sourceBlockerVars cell 1,
      v ≤ sourceSinzBase cell 1 := fun v hv =>
    sourceBlockerVars_le_sourceSinzBase cell 1 hv
  have hlocal := sinz_sat σ0 (sourceBlockerVars cell 1) 1
    (sourceSinzBase cell 1) (by decide) hcount hbelow c hc
  rw [sourceSinzAssign_eq_chain]
  rw [Census554.CoverCnf.evalClauseD_congr (σ' :=
    sinzExt σ0 (sourceBlockerVars cell 1) 1 (sourceSinzBase cell 1))]
  · exact hlocal
  · intro l hl
    have hbound := Census554.CoverCnf.sinzClauses_lit_bound
      (sourceBlockerVars cell 1) 1
      (sourceSinzBase cell 1) (by decide) hbelow c hc l hl
    rw [sourceSinzBase_eq, sourceBlockerVars, List.length_map,
      blockerCenters_length] at hbound
    norm_num at hbound
    have hbound1 : l.natAbs ≤ SafeCoverCnf.baseNumVars + 40 := by
      omega
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _ (show l.natAbs ≤
        sourceSinzBase cell (Fin.succ (Fin.succ 2)) by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 40 := hbound1
        _ ≤ sourceSinzBase cell (Fin.succ (Fin.succ 2)) := by
          rw [sourceSinzBase_eq]
          norm_num)]
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _ (show l.natAbs ≤
        sourceSinzBase cell (Fin.succ 2) by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 40 := hbound1
        _ ≤ sourceSinzBase cell (Fin.succ 2) := by
          rw [sourceSinzBase_eq]
          norm_num)]
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _
      (show l.natAbs ≤ sourceSinzBase cell 2 by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 40 := hbound1
        _ ≤ sourceSinzBase cell 2 := by
          rw [sourceSinzBase_eq]
          norm_num)]

/-- The completed five-source fold satisfies every Sinz clause emitted for
the third source block. -/
theorem sourceSinzAssign_sat_source_two
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
    (σ : Nat → Bool) {c : List Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell 2) 1
      (sourceSinzBase cell 2)) :
    evalClauseD
      (sourceSinzAssign cell (blockerAssign cell blocker σ)) c = true := by
  let σb := blockerAssign cell blocker σ
  let σ0 := sinzExt σb (sourceBlockerVars cell 0) 1
    (sourceSinzBase cell 0)
  let σ1 := sinzExt σ0 (sourceBlockerVars cell 1) 1
    (sourceSinzBase cell 1)
  have hfilter : (sourceBlockerVars cell 2).filter σ1 =
      (sourceBlockerVars cell 2).filter σb := by
    apply List.filter_congr
    intro v hv
    change sinzExt σ0 (sourceBlockerVars cell 1) 1
      (sourceSinzBase cell 1) v = σb v
    rw [sinzExt_sourceBlockerVar_of_lt cell σ0
      (i := 2) (j := 1) (by decide) hv]
    exact sinzExt_sourceBlockerVar_of_lt cell σb
      (i := 2) (j := 0) (by decide) hv
  have hcount : ((sourceBlockerVars cell 2).filter σ1).length ≤ 1 := by
    rw [hfilter,
      sourceBlockerVars_filter_blockerAssign_length cell hadded σ 2]
  have hbelow : ∀ v ∈ sourceBlockerVars cell 2,
      v ≤ sourceSinzBase cell 2 := fun v hv =>
    sourceBlockerVars_le_sourceSinzBase cell 2 hv
  have hlocal := sinz_sat σ1 (sourceBlockerVars cell 2) 1
    (sourceSinzBase cell 2) (by decide) hcount hbelow c hc
  rw [sourceSinzAssign_eq_chain]
  rw [Census554.CoverCnf.evalClauseD_congr (σ' :=
    sinzExt σ1 (sourceBlockerVars cell 2) 1 (sourceSinzBase cell 2))]
  · exact hlocal
  · intro l hl
    have hbound := Census554.CoverCnf.sinzClauses_lit_bound
      (sourceBlockerVars cell 2) 1
      (sourceSinzBase cell 2) (by decide) hbelow c hc l hl
    rw [sourceSinzBase_eq, sourceBlockerVars, List.length_map,
      blockerCenters_length] at hbound
    norm_num at hbound
    have hbound2 : l.natAbs ≤ SafeCoverCnf.baseNumVars + 60 := by
      omega
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _ (show l.natAbs ≤
        sourceSinzBase cell (Fin.succ (Fin.succ 2)) by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 60 := hbound2
        _ ≤ sourceSinzBase cell (Fin.succ (Fin.succ 2)) := by
          rw [sourceSinzBase_eq]
          norm_num)]
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _ (show l.natAbs ≤
        sourceSinzBase cell (Fin.succ 2) by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 60 := hbound2
        _ ≤ sourceSinzBase cell (Fin.succ 2) := by
          rw [sourceSinzBase_eq]
          norm_num)]

/-- The completed five-source fold satisfies every Sinz clause emitted for
the fourth source block. -/
theorem sourceSinzAssign_sat_source_three
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
    (σ : Nat → Bool) {c : List Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell (Fin.succ 2)) 1
      (sourceSinzBase cell (Fin.succ 2))) :
    evalClauseD
      (sourceSinzAssign cell (blockerAssign cell blocker σ)) c = true := by
  let σb := blockerAssign cell blocker σ
  let σ0 := sinzExt σb (sourceBlockerVars cell 0) 1
    (sourceSinzBase cell 0)
  let σ1 := sinzExt σ0 (sourceBlockerVars cell 1) 1
    (sourceSinzBase cell 1)
  let σ2 := sinzExt σ1 (sourceBlockerVars cell 2) 1
    (sourceSinzBase cell 2)
  have hfilter : (sourceBlockerVars cell (Fin.succ 2)).filter σ2 =
      (sourceBlockerVars cell (Fin.succ 2)).filter σb := by
    apply List.filter_congr
    intro v hv
    change sinzExt σ1 (sourceBlockerVars cell 2) 1
      (sourceSinzBase cell 2) v = σb v
    rw [sinzExt_sourceBlockerVar_of_lt cell σ1
      (i := Fin.succ 2) (j := 2) (by decide) hv]
    change sinzExt σ0 (sourceBlockerVars cell 1) 1
      (sourceSinzBase cell 1) v = σb v
    rw [sinzExt_sourceBlockerVar_of_lt cell σ0
      (i := Fin.succ 2) (j := 1) (by decide) hv]
    exact sinzExt_sourceBlockerVar_of_lt cell σb
      (i := Fin.succ 2) (j := 0) (by decide) hv
  have hcount :
      ((sourceBlockerVars cell (Fin.succ 2)).filter σ2).length ≤ 1 := by
    rw [hfilter,
      sourceBlockerVars_filter_blockerAssign_length cell hadded σ
        (Fin.succ 2)]
  have hbelow : ∀ v ∈ sourceBlockerVars cell (Fin.succ 2),
      v ≤ sourceSinzBase cell (Fin.succ 2) := fun v hv =>
    sourceBlockerVars_le_sourceSinzBase cell (Fin.succ 2) hv
  have hlocal := sinz_sat σ2 (sourceBlockerVars cell (Fin.succ 2)) 1
    (sourceSinzBase cell (Fin.succ 2)) (by decide) hcount hbelow c hc
  rw [sourceSinzAssign_eq_chain]
  rw [Census554.CoverCnf.evalClauseD_congr (σ' :=
    sinzExt σ2 (sourceBlockerVars cell (Fin.succ 2)) 1
      (sourceSinzBase cell (Fin.succ 2)))]
  · exact hlocal
  · intro l hl
    have hbound := Census554.CoverCnf.sinzClauses_lit_bound
      (sourceBlockerVars cell (Fin.succ 2)) 1
      (sourceSinzBase cell (Fin.succ 2)) (by decide) hbelow c hc l hl
    rw [sourceSinzBase_eq, sourceBlockerVars, List.length_map,
      blockerCenters_length] at hbound
    norm_num at hbound
    have hbound3 : l.natAbs ≤ SafeCoverCnf.baseNumVars + 80 := by
      omega
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _ (show l.natAbs ≤
        sourceSinzBase cell (Fin.succ (Fin.succ 2)) by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 80 := hbound3
        _ ≤ sourceSinzBase cell (Fin.succ (Fin.succ 2)) := by
          rw [sourceSinzBase_eq]
          norm_num)]

/-- The completed five-source fold satisfies every Sinz clause emitted for
the fifth source block. -/
theorem sourceSinzAssign_sat_source_four
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
    (σ : Nat → Bool) {c : List Int}
    (hc : c ∈ sinzClauses
      (sourceBlockerVars cell (Fin.succ (Fin.succ 2))) 1
      (sourceSinzBase cell (Fin.succ (Fin.succ 2)))) :
    evalClauseD
      (sourceSinzAssign cell (blockerAssign cell blocker σ)) c = true := by
  let σb := blockerAssign cell blocker σ
  let σ0 := sinzExt σb (sourceBlockerVars cell 0) 1
    (sourceSinzBase cell 0)
  let σ1 := sinzExt σ0 (sourceBlockerVars cell 1) 1
    (sourceSinzBase cell 1)
  let σ2 := sinzExt σ1 (sourceBlockerVars cell 2) 1
    (sourceSinzBase cell 2)
  let σ3 := sinzExt σ2 (sourceBlockerVars cell (Fin.succ 2)) 1
    (sourceSinzBase cell (Fin.succ 2))
  have hfilter :
      (sourceBlockerVars cell (Fin.succ (Fin.succ 2))).filter σ3 =
        (sourceBlockerVars cell (Fin.succ (Fin.succ 2))).filter σb := by
    apply List.filter_congr
    intro v hv
    change sinzExt σ2 (sourceBlockerVars cell (Fin.succ 2)) 1
      (sourceSinzBase cell (Fin.succ 2)) v = σb v
    rw [sinzExt_sourceBlockerVar_of_lt cell σ2
      (i := Fin.succ (Fin.succ 2)) (j := Fin.succ 2) (by decide) hv]
    change sinzExt σ1 (sourceBlockerVars cell 2) 1
      (sourceSinzBase cell 2) v = σb v
    rw [sinzExt_sourceBlockerVar_of_lt cell σ1
      (i := Fin.succ (Fin.succ 2)) (j := 2) (by decide) hv]
    change sinzExt σ0 (sourceBlockerVars cell 1) 1
      (sourceSinzBase cell 1) v = σb v
    rw [sinzExt_sourceBlockerVar_of_lt cell σ0
      (i := Fin.succ (Fin.succ 2)) (j := 1) (by decide) hv]
    exact sinzExt_sourceBlockerVar_of_lt cell σb
      (i := Fin.succ (Fin.succ 2)) (j := 0) (by decide) hv
  have hcount :
      ((sourceBlockerVars cell (Fin.succ (Fin.succ 2))).filter σ3).length ≤ 1 := by
    rw [hfilter,
      sourceBlockerVars_filter_blockerAssign_length cell hadded σ
        (Fin.succ (Fin.succ 2))]
  have hbelow :
      ∀ v ∈ sourceBlockerVars cell (Fin.succ (Fin.succ 2)),
        v ≤ sourceSinzBase cell (Fin.succ (Fin.succ 2)) := fun v hv =>
    sourceBlockerVars_le_sourceSinzBase cell (Fin.succ (Fin.succ 2)) hv
  have hlocal := sinz_sat σ3
    (sourceBlockerVars cell (Fin.succ (Fin.succ 2))) 1
    (sourceSinzBase cell (Fin.succ (Fin.succ 2))) (by decide)
    hcount hbelow c hc
  rw [sourceSinzAssign_eq_chain]
  exact hlocal

/-- The canonical source-Sinz assignment satisfies the clauses emitted for
any of the five physical-source counters. -/
theorem sourceSinzAssign_sat_source
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
    (σ : Nat → Bool) (i : Fin 5) {c : List Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell i) 1
      (sourceSinzBase cell i)) :
    evalClauseD
      (sourceSinzAssign cell (blockerAssign cell blocker σ)) c = true := by
  fin_cases i
  · exact sourceSinzAssign_sat_source_zero cell hadded σ hc
  · exact sourceSinzAssign_sat_source_one cell hadded σ hc
  · exact sourceSinzAssign_sat_source_two cell hadded σ hc
  · exact sourceSinzAssign_sat_source_three cell hadded σ hc
  · exact sourceSinzAssign_sat_source_four cell hadded σ hc

/-- One source-wise Sinz extension leaves every source blocker input
unchanged, whether that input belongs to an earlier, current, or later source
block. -/
theorem sinzExt_sourceBlockerVar (cell : FrozenV14JobCoordinate)
    (σ : Nat → Bool) (i j : Fin 5) {v : Nat}
    (hv : v ∈ sourceBlockerVars cell i) :
    sinzExt σ (sourceBlockerVars cell j) 1 (sourceSinzBase cell j) v = σ v := by
  rcases lt_trichotomy j.val i.val with hji | hji | hij
  · exact sinzExt_sourceBlockerVar_of_lt cell σ hji hv
  · have hfin : j = i := Fin.ext hji
    subst j
    exact Census554.CoverCnf.sinzExt_le σ (sourceBlockerVars cell i) 1
      (sourceSinzBase cell i) (sourceBlockerVars_le_sourceSinzBase cell i hv)
  · simp only [sourceBlockerVars, List.mem_map] at hv
    obtain ⟨center, hcenter, rfl⟩ := hv
    apply Census554.CoverCnf.sinzExt_le
    have hbounds := (blockerVar_bounds_of_mem cell i hcenter).2
    rw [sourceSinzBase_eq]
    omega

/-- The complete source-wise Sinz fold leaves every blocker input unchanged. -/
theorem sourceSinzAssign_sourceBlockerVar (cell : FrozenV14JobCoordinate)
    (σ : Nat → Bool) (i : Fin 5) {v : Nat}
    (hv : v ∈ sourceBlockerVars cell i) :
    sourceSinzAssign cell σ v = σ v := by
  unfold sourceSinzAssign
  induction List.finRange 5 generalizing σ with
  | nil => rfl
  | cons j js ih =>
      rw [List.foldl_cons, ih]
      exact sinzExt_sourceBlockerVar cell σ i j hv

/-- Every center-wise input is a source blocker input and therefore survives
the complete source-wise Sinz fold. -/
theorem sourceSinzAssign_centerBlockerVar (cell : FrozenV14JobCoordinate)
    (σ : Nat → Bool) (center : Nat) {v : Nat}
    (hv : v ∈ centerBlockerVars cell center) :
    sourceSinzAssign cell σ v = σ v := by
  unfold centerBlockerVars at hv
  rw [List.mem_filterMap] at hv
  obtain ⟨i, _hi, hiOption⟩ := hv
  split at hiOption
  next hcenter =>
    simp only [Option.some.injEq] at hiOption
    subst v
    apply sourceSinzAssign_sourceBlockerVar cell σ i
    exact List.mem_map.mpr ⟨center, hcenter, rfl⟩
  next => simp at hiOption

/-- The source-Sinz assignment and blocker assignment select the same inputs
inside every center-wise counter. -/
theorem centerBlockerVars_filter_sourceSinzAssign
    (cell : FrozenV14JobCoordinate) (blocker : Fin 5 → Label)
    (σ : Nat → Bool) (center : Nat) :
    (centerBlockerVars cell center).filter
        (sourceSinzAssign cell (blockerAssign cell blocker σ)) =
      (centerBlockerVars cell center).filter
        (blockerAssign cell blocker σ) := by
  apply List.filter_congr
  intro v hv
  exact sourceSinzAssign_centerBlockerVar cell
    (blockerAssign cell blocker σ) center hv

/-- Every blocker input lies before the end of the five source blocks. -/
theorem blockerVar_le_sourceBlocksEnd (cell : FrozenV14JobCoordinate)
    (i : Fin 5) {center : Nat}
    (hcenter : center ∈
      blockerCenters ((physicalSources cell).getD i.val 0)) :
    blockerVar cell i center ≤ sourceBlocksEnd cell := by
  have hbounds := (blockerVar_bounds_of_mem cell i hcenter).2
  rw [sourceBlocksEnd]
  have hsum :
      ((List.finRange 5).map fun j => sourceBlockWidth cell j).sum = 100 := by
    norm_num [List.finRange, sourceBlockWidth_eq]
  rw [hsum]
  omega

/-- Every center-wise blocker input lies before the center-counter region. -/
theorem centerBlockerVars_le_sourceBlocksEnd (cell : FrozenV14JobCoordinate)
    (center : Nat) {v : Nat} (hv : v ∈ centerBlockerVars cell center) :
    v ≤ sourceBlocksEnd cell := by
  unfold centerBlockerVars at hv
  rw [List.mem_filterMap] at hv
  obtain ⟨i, _hi, hiOption⟩ := hv
  split at hiOption
  next hcenter =>
    simp only [Option.some.injEq] at hiOption
    subst v
    exact blockerVar_le_sourceBlocksEnd cell i hcenter
  next => simp at hiOption

/-- Every center-wise input lies below that center's auxiliary base. -/
theorem centerBlockerVars_le_centerSinzBase (cell : FrozenV14JobCoordinate)
    (center : Nat) {v : Nat} (hv : v ∈ centerBlockerVars cell center) :
    v ≤ centerSinzBase cell center := by
  unfold centerBlockerVars at hv
  rw [List.mem_filterMap] at hv
  obtain ⟨i, _hi, hiOption⟩ := hv
  split at hiOption
  next hcenter =>
    simp only [Option.some.injEq] at hiOption
    subst v
    have hsource := blockerVar_le_sourceBlocksEnd cell i hcenter
    simp only [centerSinzBase]
    omega
  next => simp at hiOption

/-- Extend through the twelve center-wise bound-one Sinz blocks, in increasing
center order. -/
def centerSinzAssign (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) :
    Nat → Bool :=
  (List.range 12).foldl
    (fun acc center =>
      sinzExt acc (centerBlockerVars cell center) 1
        (centerSinzBase cell center)) σ

/-- The center-Sinz accumulator immediately before center `center`. -/
def centerSinzAcc (cell : FrozenV14JobCoordinate) (σ : Nat → Bool)
    (center : Nat) : Nat → Bool :=
  ((List.range 12).take center).foldl
    (fun acc q =>
      sinzExt acc (centerBlockerVars cell q) 1
        (centerSinzBase cell q)) σ

/-- The next center auxiliary base is the current base plus the current Sinz
variable count. -/
theorem centerSinzBase_succ (cell : FrozenV14JobCoordinate) (center : Nat) :
    centerSinzBase cell (center + 1) =
      centerSinzBase cell center +
        sinzVarCount (centerBlockerVars cell center).length 1 := by
  simp [centerSinzBase, List.range_succ,
    List.map_append, List.sum_append, Nat.add_assoc]

/-- Center auxiliary bases are monotone in the center index. -/
theorem centerSinzBase_mono (cell : FrozenV14JobCoordinate) {a b : Nat}
    (hab : a ≤ b) : centerSinzBase cell a ≤ centerSinzBase cell b := by
  have hsum :
      ∀ {a b : Nat}, a ≤ b →
        ((List.range a).map fun c =>
          sinzVarCount (centerBlockerVars cell c).length 1).sum ≤
        ((List.range b).map fun c =>
          sinzVarCount (centerBlockerVars cell c).length 1).sum := by
    intro a b hab
    induction hab with
    | refl => exact le_rfl
    | @step b _ ih =>
        simp only [Nat.succ_eq_add_one, List.range_succ,
          List.map_append, List.sum_append]
        omega
  simp only [centerSinzBase]
  exact Nat.add_le_add_left (hsum hab) _

/-- On variables in or before the next center base, the full center fold is
exactly its prefix accumulator followed by the current center extension. -/
theorem centerSinzAssign_block (cell : FrozenV14JobCoordinate)
    (σ : Nat → Bool) {center v : Nat} (hcenter : center < 12)
    (hv : v ≤ centerSinzBase cell (center + 1)) :
    centerSinzAssign cell σ v =
      sinzExt (centerSinzAcc cell σ center)
        (centerBlockerVars cell center) 1
        (centerSinzBase cell center) v := by
  have hp12 : center < (List.range 12).length := by
    rw [List.length_range]
    exact hcenter
  have htake :
      (List.range 12).take (center + 1) =
        (List.range 12).take center ++ [center] := by
    rw [List.take_add_one, List.getElem?_eq_getElem hp12]
    simp [List.getElem_range]
  simp only [centerSinzAssign, centerSinzAcc]
  conv_lhs =>
    rw [← List.take_append_drop (center + 1) (List.range 12)]
  rw [List.foldl_append, htake, List.foldl_append, List.foldl_cons,
    List.foldl_nil]
  refine SafeCoverCnf.foldl_sinzExt_low
    ((List.range 12).drop (center + 1))
    (fun q => centerBlockerVars cell q) (fun _ => 1)
    (fun q => centerSinzBase cell q) _ ?_
  intro q hq
  rw [List.range_eq_range', List.drop_range', List.mem_range'] at hq
  exact le_trans hv (centerSinzBase_mono cell (by omega))

/-- The completed center-wise Sinz fold satisfies every clause emitted for
each of the twelve center counters. -/
theorem centerSinzAssign_sat_center
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
    (σ : Nat → Bool) {center : Nat} (hcenter : center < 12)
    {c : List Int}
    (hc : c ∈ sinzClauses (centerBlockerVars cell center) 1
      (centerSinzBase cell center)) :
    evalClauseD
      (centerSinzAssign cell
        (sourceSinzAssign cell (blockerAssign cell blocker σ))) c = true := by
  let σb := blockerAssign cell blocker σ
  let τ := sourceSinzAssign cell σb
  let xs := centerBlockerVars cell center
  let base := centerSinzBase cell center
  let pre := centerSinzAcc cell τ center
  by_cases hm : xs.length ≤ 1
  · have hm' : (centerBlockerVars cell center).length ≤ 1 := by
      simpa [xs] using hm
    unfold sinzClauses at hc
    rw [if_pos hm'] at hc
    simp at hc
  · have hbelow : ∀ v ∈ xs, v ≤ base := fun v hv =>
      centerBlockerVars_le_centerSinzBase cell center hv
    have hpre : ∀ v ∈ xs, pre v = τ v := by
      intro v hv
      unfold pre centerSinzAcc
      apply SafeCoverCnf.foldl_sinzExt_low
      intro q hq
      exact le_trans (centerBlockerVars_le_sourceBlocksEnd cell center hv)
        (by simp only [centerSinzBase]; omega)
    have hcount : (xs.filter pre).length ≤ 1 := by
      calc
        (xs.filter pre).length = (xs.filter τ).length := by
          congr 1
          apply List.filter_congr
          intro v hv
          exact hpre v hv
        _ = (xs.filter σb).length := by
          simpa [τ, σb, xs] using congrArg List.length
            (centerBlockerVars_filter_sourceSinzAssign cell blocker σ center)
        _ ≤ 1 := by
          simpa [σb, xs] using
            centerBlockerVars_filter_blockerAssign_length_le_one
              cell hadded σ center
    have hlocal := Census554.CoverCnf.sinz_sat pre xs 1 base
      (by decide) hcount hbelow c hc
    rw [Census554.CoverCnf.evalClauseD_congr (σ' :=
      sinzExt pre xs 1 base)]
    · exact hlocal
    · intro l hl
      have hbound := Census554.CoverCnf.sinzClauses_lit_bound
        xs 1 base (by decide) hbelow c hc l hl
      have hlit : l.natAbs ≤ centerSinzBase cell (center + 1) := by
        have hm' : ¬ (centerBlockerVars cell center).length ≤ 1 := by
          simpa [xs] using hm
        rw [centerSinzBase_succ]
        simp only [sinzVarCount, if_neg hm']
        simpa [xs, base] using hbound
      exact centerSinzAssign_block cell τ hcenter hlit

/-- Canonical valuation proposed for one semantic normalized-v14 job: the
source-faithful base witness, its five selected blockers, and both layers of
Sinz auxiliaries. -/
def v14Assign (cell : FrozenV14JobCoordinate) (blocker : Fin 5 → Label)
    (idx : Nat → Nat) : Nat → Bool :=
  centerSinzAssign cell <|
    sourceSinzAssign cell <|
      blockerAssign cell blocker (SafeCoverCnf.finalAssign idx)

/-- Every blocker input is strictly above the source-faithful base CNF. -/
theorem baseNumVars_lt_blockerVar (cell : FrozenV14JobCoordinate) (i : Fin 5)
    (center : Nat) :
    SafeCoverCnf.baseNumVars < blockerVar cell i center := by
  simp only [blockerVar, sourceBlockBase]
  omega

/-- Installing blocker inputs leaves the complete source-faithful assignment
unchanged on its original variable interval. -/
theorem blockerAssign_low (cell : FrozenV14JobCoordinate)
    (blocker : Fin 5 → Label) (σ : Nat → Bool) {v : Nat}
    (hv : v ≤ SafeCoverCnf.baseNumVars) :
    blockerAssign cell blocker σ v = σ v := by
  rw [blockerAssign, if_neg]
  intro hmem
  simp only [allBlockerVars, List.mem_flatMap, List.mem_finRange] at hmem
  obtain ⟨i, _hi, hvar⟩ := hmem
  simp only [sourceBlockerVars, List.mem_map] at hvar
  obtain ⟨center, _hcenter, rfl⟩ := hvar
  exact (not_lt_of_ge hv) (baseNumVars_lt_blockerVar cell i center)

/-- The source-wise Sinz fold preserves the original source-faithful variable
interval. -/
theorem sourceSinzAssign_low (cell : FrozenV14JobCoordinate) (σ : Nat → Bool)
    {v : Nat} (hv : v ≤ SafeCoverCnf.baseNumVars) :
    sourceSinzAssign cell σ v = σ v := by
  unfold sourceSinzAssign
  apply SafeCoverCnf.foldl_sinzExt_low
  intro i _hi
  simp only [sourceSinzBase, sourceBlockBase]
  omega

/-- The center-wise Sinz fold preserves every variable allocated before the
center blocks. -/
theorem centerSinzAssign_low (cell : FrozenV14JobCoordinate) (σ : Nat → Bool)
    {v : Nat} (hv : v ≤ sourceBlocksEnd cell) :
    centerSinzAssign cell σ v = σ v := by
  unfold centerSinzAssign
  apply SafeCoverCnf.foldl_sinzExt_low
  intro center _hcenter
  simp only [centerSinzBase]
  omega

/-- The complete v14 witness agrees with the proved base witness on every
source-faithful base-CNF variable. -/
theorem v14Assign_base_low (cell : FrozenV14JobCoordinate)
    (blocker : Fin 5 → Label) (idx : Nat → Nat) {v : Nat}
    (hv : v ≤ SafeCoverCnf.baseNumVars) :
    v14Assign cell blocker idx v = SafeCoverCnf.finalAssign idx v := by
  rw [v14Assign, centerSinzAssign_low, sourceSinzAssign_low,
    blockerAssign_low]
  · exact hv
  · exact hv
  · rw [sourceBlocksEnd]
    omega

/-- The five source blocks occupy exactly one hundred variables. -/
theorem sourceBlocksEnd_eq (cell : FrozenV14JobCoordinate) :
    sourceBlocksEnd cell = 42660 := by
  rw [sourceBlocksEnd, SafeCoverCnf.baseNumVars_eq]
  revert cell
  set_option maxRecDepth 100000 in
    native_decide

/-- The center-wise counters allocate fifty further variables. -/
theorem centerSinzVarCount_eq (cell : FrozenV14JobCoordinate) :
    ((List.range 12).map fun center =>
      sinzVarCount (centerBlockerVars cell center).length 1).sum = 50 := by
  revert cell
  set_option maxRecDepth 100000 in
    native_decide

/-- Exact final variable counter reported by every bound v14 job. -/
theorem finalNumVars_eq (cell : FrozenV14JobCoordinate) :
    finalNumVars cell = 42710 := by
  calc
    finalNumVars cell = sourceBlocksEnd cell + 50 := by
      rw [finalNumVars, centerSinzVarCount_eq]
    _ = 42660 + 50 := by rw [sourceBlocksEnd_eq]
    _ = 42710 := by decide

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
