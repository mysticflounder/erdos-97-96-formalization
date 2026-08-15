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

private theorem blockerCenters_length_label (source : Label)
    (hne : source ≠ 1) :
    (blockerCenters source.val).length = 10 := by
  fin_cases source <;> simp_all [blockerCenters] <;> decide

private theorem representative_components_ne_one
    (placement : FrozenV14Placement) :
    (placement.1 : Label × Label).1 ≠ 1 ∧
      (placement.1 : Label × Label).2 ≠ 1 := by
  rcases placement with ⟨⟨jd, v⟩, hplacement⟩
  rw [← frozenSeparatedPlacementRepresentativeList_toFinset] at hplacement
  simp [frozenSeparatedPlacementRepresentativeList] at hplacement
  rcases hplacement with
      (⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ |
       ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ |
       ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩) <;>
    decide +revert

/-- Every scheduled physical source has exactly ten blocker candidates. -/
theorem blockerCenters_length (cell : FrozenV14JobCoordinate) (i : Fin 5) :
    (blockerCenters ((physicalSources cell).getD i.val 0)).length = 10 := by
  have hne := representative_components_ne_one cell.1
  fin_cases i
  · simpa [physicalSources] using
      blockerCenters_length_label (6 : Label) (by decide)
  · simpa [physicalSources] using
      blockerCenters_length_label (9 : Label) (by decide)
  · simpa [physicalSources, jointDeletion] using
      blockerCenters_length_label (cell.1.1 : Label × Label).1 hne.1
  · simpa [physicalSources, vLabel] using
      blockerCenters_length_label (cell.1.1 : Label × Label).2 hne.2
  · simpa [physicalSources] using
      blockerCenters_length_label (8 : Label) (by decide)

/-- Every source block has the compiler's fixed width `10 + 10`. -/
theorem sourceBlockWidth_eq (cell : FrozenV14JobCoordinate) (i : Fin 5) :
    sourceBlockWidth cell i = 20 := by
  rw [sourceBlockWidth, blockerCenters_length]
  decide

/-- Closed form of the source-block counter. -/
theorem sourceBlockBase_eq (cell : FrozenV14JobCoordinate) (i : Fin 5) :
    sourceBlockBase cell i = SafeCoverCnf.baseNumVars + 20 * i.val := by
  unfold sourceBlockBase
  have hmap :
      (((List.finRange 5).take i.val).map fun j => sourceBlockWidth cell j) =
        (((List.finRange 5).take i.val).map fun _ => 20) := by
    apply List.map_congr_left
    intro j hj
    exact sourceBlockWidth_eq cell j
  rw [hmap]
  have hsum :
      (List.map (fun _ => 20) (List.take i.val (List.finRange 5))).sum =
        (List.take i.val (List.finRange 5)).length * 20 := by
    induction (List.take i.val (List.finRange 5)) with
    | nil => rfl
    | cons x xs ih =>
        simp only [List.map_cons, List.sum_cons, List.length_cons,
          ih, Nat.succ_mul]
        omega
  rw [hsum]
  simp only [List.length_take, List.length_finRange]
  rw [Nat.min_eq_left i.isLt.le]
  omega

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
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (i : Fin 5) :
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
