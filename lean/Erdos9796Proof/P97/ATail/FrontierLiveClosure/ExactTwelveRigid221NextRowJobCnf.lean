/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowJobSemantics
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnf

/-!
# Exact CNF layout for next-row-only-hit jobs

This module reconstructs the clauses appended by
`census/card_head/exact12_next_row_valuation.py`.  It reuses the exact
physical-cycle prefix proved for normalized-v14 jobs and then allocates the
ten distinguished-row selectors and their bound-one Sinz counter.

The result is a source-to-CNF reflection layer for one normalized placement.
It is not a terminal UNSAT result, aggregate placement coverage, or closure of
the live Rigid221 residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenNextRowJobCnf

open Census554.CoverCnf
open Census554.EqualityCore
open SafeCoverCnf
open ExactTwelveCarrierIngress
open FrozenV14JobCnf

/-- A next-row compiler cell has only the normalized placement coordinate. -/
abbrev FrozenNextRowCell := FrozenV14Placement

/-- The shared v14 layout is independent of its suffix coordinates.  Fixing
these arbitrary admissible values exposes that layout without importing the
v14-specific suffix semantics. -/
def canonicalV14Coordinate (cell : FrozenNextRowCell) :
    FrozenV14JobCoordinate :=
  (cell, .uQ, ⟨(0 : Label), by decide⟩)

/-- Candidate distinguished centers, in the exact Python insertion order. -/
def selectorCenters : List Nat := [0, 2, 3, 4, 5, 6, 8, 9, 10, 11]

/-- Source-safe selected rows accepted by a distinguished-center selector. -/
def eligibleRowVars (d : Nat) : List Nat :=
  varsMatching d fun m =>
    m.testBit 7 && m.testBit 9 && !m.testBit 6 && !m.testBit 8

/-- Exact selector variable assigned to one candidate center. -/
def selectorVar (cell : FrozenNextRowCell) (d : Nat) : Nat :=
  finalNumVars (canonicalV14Coordinate cell) + selectorCenters.idxOf d + 1

/-- All ten selector variables in compiler order. -/
def selectorVars (cell : FrozenNextRowCell) : List Nat :=
  selectorCenters.map (selectorVar cell)

/-- Variable counter at which the selector Sinz auxiliaries begin. -/
def selectorSinzBase (cell : FrozenNextRowCell) : Nat :=
  finalNumVars (canonicalV14Coordinate cell) + selectorCenters.length

/-- The selector implication for one candidate distinguished center. -/
def selectorRowClause (cell : FrozenNextRowCell) (d : Nat) : List Int :=
  -Int.ofNat (selectorVar cell d) :: (eligibleRowVars d).map Int.ofNat

/-- Optional exclusions of the joint-deletion and `v` blockers.  Absence of a
blocker variable matches Python's `dict.get` behavior exactly. -/
def selectorBlockerClauses (cell : FrozenNextRowCell) (d : Nat) :
    List (List Int) :=
  let layout := canonicalV14Coordinate cell
  (if d ∈ blockerCenters ((physicalSources layout).getD 2 0) then
      [[-Int.ofNat (selectorVar cell d),
        -Int.ofNat (blockerVar layout 2 d)]]
    else []) ++
    (if d ∈ blockerCenters ((physicalSources layout).getD 3 0) then
      [[-Int.ofNat (selectorVar cell d),
        -Int.ofNat (blockerVar layout 3 d)]]
    else [])

/-- Exact job-specific suffix emitted after the common physical-cycle prefix. -/
def nextRowOnlyHitClauseDelta (cell : FrozenNextRowCell) :
    List (List Int) :=
  (selectorCenters.flatMap fun d =>
      [selectorRowClause cell d] ++ selectorBlockerClauses cell d) ++
    [(selectorVars cell).map Int.ofNat] ++
      sinzClauses (selectorVars cell) 1 (selectorSinzBase cell)

/-- Complete ordered clause delta emitted for one next-row-only-hit cell. -/
def reconstructedClauseDelta (cell : FrozenNextRowCell) :
    List (List Int) :=
  commonPhysicalCycleClauseDelta (canonicalV14Coordinate cell) ++
    nextRowOnlyHitClauseDelta cell

/-- The selector layout begins immediately after the 42,710-variable common
physical-cycle assignment. -/
theorem selectorVars_eq (cell : FrozenNextRowCell) :
    selectorVars cell =
      [42711, 42712, 42713, 42714, 42715,
        42716, 42717, 42718, 42719, 42720] := by
  simp [selectorVars, selectorVar, selectorCenters,
    FrozenV14JobCnf.finalNumVars_eq]

/-- Exact auxiliary-variable base of the selector counter. -/
theorem selectorSinzBase_eq (cell : FrozenNextRowCell) :
    selectorSinzBase cell = 42720 := by
  simp [selectorSinzBase, selectorCenters,
    FrozenV14JobCnf.finalNumVars_eq]

/-- Highest variable allocated by the complete next-row selector extension. -/
def nextRowFinalNumVars (cell : FrozenNextRowCell) : Nat :=
  selectorSinzBase cell + (selectorVars cell).length

/-- Exact variable ceiling of the reconstructed next-row job. -/
theorem nextRowFinalNumVars_eq (cell : FrozenNextRowCell) :
    nextRowFinalNumVars cell = 42730 := by
  simp [nextRowFinalNumVars, selectorSinzBase_eq, selectorVars_eq]

/-- Every literal emitted by the selector suffix lies below its exact variable
ceiling.  This checks the compiler-order reconstruction independently of a
future terminal certificate. -/
theorem nextRowOnlyHitClauseDelta_lit_bound (cell : FrozenNextRowCell) :
    ∀ c ∈ nextRowOnlyHitClauseDelta cell, ∀ l ∈ c,
      l.natAbs ≤ nextRowFinalNumVars cell := by
  revert cell
  native_decide

/-- Assignment that chooses exactly one distinguished-center selector while
preserving the common physical-cycle assignment elsewhere. -/
def selectorAssign (cell : FrozenNextRowCell) (d : Nat)
    (σ : Nat → Bool) : Nat → Bool :=
  fun v =>
    if v ∈ selectorVars cell then decide (v = selectorVar cell d) else σ v

/-- Canonical assignment including the selector bound-one Sinz auxiliaries. -/
def nextRowAssign (cell : FrozenNextRowCell) (blocker : Fin 5 → Label)
    (row : RowPattern Label) (d : Label) : Nat → Bool :=
  sinzExt
    (selectorAssign cell d.val
      (v14Assign (canonicalV14Coordinate cell) blocker
        (SafeCoverIndexBridge.coverIndex row)))
    (selectorVars cell) 1 (selectorSinzBase cell)

/-- The successor assignment agrees with the shared physical-cycle assignment
through the end of that assignment's variable interval. -/
theorem nextRowAssign_low (cell : FrozenNextRowCell)
    (blocker : Fin 5 → Label) (row : RowPattern Label) (d : Label)
    {v : Nat} (hv : v ≤ finalNumVars (canonicalV14Coordinate cell)) :
    nextRowAssign cell blocker row d v =
      v14Assign (canonicalV14Coordinate cell) blocker
        (SafeCoverIndexBridge.coverIndex row) v := by
  have hvbase : v ≤ selectorSinzBase cell := by
    simp only [selectorSinzBase]
    omega
  rw [nextRowAssign, sinzExt_le _ _ _ _ hvbase]
  simp only [selectorAssign]
  rw [if_neg]
  intro hmem
  rw [selectorVars_eq] at hmem
  rw [FrozenV14JobCnf.finalNumVars_eq] at hv
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hmem
  omega

/-- The explicitly selected distinguished-center variable is true before the
selector Sinz extension. -/
theorem selectorAssign_selected (cell : FrozenNextRowCell) (d : Nat)
    (σ : Nat → Bool) (hd : d ∈ selectorCenters) :
    selectorAssign cell d σ (selectorVar cell d) = true := by
  have hmem : selectorVar cell d ∈ selectorVars cell :=
    List.mem_map.mpr ⟨d, hd, rfl⟩
  simp [selectorAssign, hmem]

/-- The two excluded pinned labels are exactly the labels absent from the
distinguished-center selector list. -/
theorem mem_selectorCenters_of_ne_one_ne_seven {d : Label}
    (hone : d ≠ 1) (hseven : d ≠ 7) :
    d.val ∈ selectorCenters := by
  fin_cases d <;> simp_all [selectorCenters]

/-- Selector variables are injective on their intended ten-center domain. -/
theorem selectorVar_injective_on_selectorCenters (cell : FrozenNextRowCell)
    {d e : Label} (hd : d.val ∈ selectorCenters)
    (he : e.val ∈ selectorCenters) :
    selectorVar cell d.val = selectorVar cell e.val ↔ d = e := by
  constructor
  · intro h
    apply Fin.ext
    apply (List.idxOf_inj hd).mp
    simp only [selectorVar] at h
    omega
  · intro h
    subst e
    rfl

/-- Every nonselected selector input is false before the Sinz extension. -/
theorem selectorAssign_not_selected (cell : FrozenNextRowCell)
    (d e : Label) (hd : d.val ∈ selectorCenters)
    (he : e.val ∈ selectorCenters) (hne : e ≠ d)
    (σ : Nat → Bool) :
    selectorAssign cell d.val σ (selectorVar cell e.val) = false := by
  have hmem : selectorVar cell e.val ∈ selectorVars cell :=
    List.mem_map.mpr ⟨e.val, he, rfl⟩
  simp only [selectorAssign, if_pos hmem, decide_eq_false_iff_not]
  intro hvar
  exact hne ((selectorVar_injective_on_selectorCenters cell he
    hd).mp hvar)

/-- The selected distinguished-center variable remains true in the complete
successor assignment. -/
theorem nextRowAssign_selected (cell : FrozenNextRowCell)
    (blocker : Fin 5 → Label) (row : RowPattern Label) (d : Label)
    (hd : d.val ∈ selectorCenters) :
    nextRowAssign cell blocker row d (selectorVar cell d.val) = true := by
  have hidx : selectorCenters.idxOf d.val < selectorCenters.length :=
    (List.idxOf_lt_length_iff (l := selectorCenters) (a := d.val)).2 hd
  have hle : selectorVar cell d.val ≤ selectorSinzBase cell := by
    simp only [selectorVar, selectorSinzBase]
    omega
  rw [nextRowAssign, sinzExt_le _ _ _ _ hle]
  exact selectorAssign_selected cell d.val _ hd

/-- Every nonselected distinguished-center variable remains false in the
complete successor assignment. -/
theorem nextRowAssign_not_selected (cell : FrozenNextRowCell)
    (blocker : Fin 5 → Label) (row : RowPattern Label) (d e : Label)
    (hd : d.val ∈ selectorCenters) (he : e.val ∈ selectorCenters)
    (hne : e ≠ d) :
    nextRowAssign cell blocker row d (selectorVar cell e.val) = false := by
  have hidx : selectorCenters.idxOf e.val < selectorCenters.length :=
    (List.idxOf_lt_length_iff (l := selectorCenters) (a := e.val)).2 he
  have hle : selectorVar cell e.val ≤ selectorSinzBase cell := by
    simp only [selectorVar, selectorSinzBase]
    omega
  rw [nextRowAssign, sinzExt_le _ _ _ _ hle]
  exact selectorAssign_not_selected cell d e hd he hne _

set_option maxHeartbeats 800000 in
/-- Exactly one input of the selector counter is true before extension. -/
theorem selectorAssign_filter_length_eq_one (cell : FrozenNextRowCell)
    (d : Label) (hd : d.val ∈ selectorCenters) (σ : Nat → Bool) :
    ((selectorVars cell).filter (selectorAssign cell d.val σ)).length = 1 := by
  rw [selectorVars_eq]
  fin_cases d <;>
    simp_all [selectorAssign, selectorVars_eq, selectorVar, selectorCenters,
      FrozenV14JobCnf.finalNumVars_eq]

/-- The source-selected candidate variable remains true in the successor
assignment. -/
theorem nextRowAssign_selected_xVar
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label)
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row) (d : Label) :
    nextRowAssign cell blocker row d
        (SafeCoverCnf.xVar d.val (SafeCoverIndexBridge.coverIndex row d.val)) =
      true := by
  have hi := SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow d.isLt
  have hxbase :
      SafeCoverCnf.xVar d.val (SafeCoverIndexBridge.coverIndex row d.val) ≤
        SafeCoverCnf.baseNumVars := by
    calc
      SafeCoverCnf.xVar d.val (SafeCoverIndexBridge.coverIndex row d.val) ≤
          SafeCoverCnf.nX := SafeCoverCnf.xVar_le_nX d.isLt hi
      _ ≤ SafeCoverCnf.baseNumVars := by
        rw [SafeCoverCnf.nX_eq, SafeCoverCnf.baseNumVars_eq]
        omega
  have hxFinal :
      SafeCoverCnf.xVar d.val (SafeCoverIndexBridge.coverIndex row d.val) ≤
        finalNumVars (canonicalV14Coordinate cell) := by
    rw [FrozenV14JobCnf.finalNumVars_eq]
    exact hxbase.trans (by
      rw [SafeCoverCnf.baseNumVars_eq]
      omega)
  rw [nextRowAssign_low cell blocker row d hxFinal]
  exact (v14Assign_xVar_eq_true_iff
    (canonicalV14Coordinate cell) blocker
    (SafeCoverIndexBridge.coverIndex row)
    (fun _ hp => SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow hp)
    d.isLt hi).2 rfl

/-- The row facts in a next-row dichotomy place its selected candidate in the
compiler's eligible-row list. -/
theorem selected_xVar_mem_eligibleRowVars
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row) {d : Label}
    (hseven : 7 ∈ row d) (hnine : 9 ∈ row d)
    (hsix : 6 ∉ row d) (height : 8 ∉ row d) :
    SafeCoverCnf.xVar d.val (SafeCoverIndexBridge.coverIndex row d.val) ∈
      eligibleRowVars d.val := by
  apply xVar_mem_varsMatching
  · exact SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow d.isLt
  · have h7bit :
        ((SafeCoverCnf.candMasks d.val).getD
          (SafeCoverIndexBridge.coverIndex row d.val) 0).testBit 7 = true := by
      simpa using (SafeCoverIndexBridge.coverIndex_testBit_of_safeCubeOK
        hrow d (7 : Label)).trans (decide_eq_true hseven)
    have h9bit :
        ((SafeCoverCnf.candMasks d.val).getD
          (SafeCoverIndexBridge.coverIndex row d.val) 0).testBit 9 = true := by
      simpa using (SafeCoverIndexBridge.coverIndex_testBit_of_safeCubeOK
        hrow d (9 : Label)).trans (decide_eq_true hnine)
    have h6bit :
        ((SafeCoverCnf.candMasks d.val).getD
          (SafeCoverIndexBridge.coverIndex row d.val) 0).testBit 6 = false := by
      simpa using (SafeCoverIndexBridge.coverIndex_testBit_of_safeCubeOK
        hrow d (6 : Label)).trans (decide_eq_false hsix)
    have h8bit :
        ((SafeCoverCnf.candMasks d.val).getD
          (SafeCoverIndexBridge.coverIndex row d.val) 0).testBit 8 = false := by
      simpa using (SafeCoverIndexBridge.coverIndex_testBit_of_safeCubeOK
        hrow d (8 : Label)).trans (decide_eq_false height)
    simp only [h7bit, h9bit, h6bit, h8bit, Bool.and_self,
      Bool.not_false]

/-- The assignment selected by a next-row witness satisfies every
distinguished-center row implication. -/
theorem nextRowAssign_sat_selectorRowClause
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label)
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (d e : Label) (hd : d.val ∈ selectorCenters)
    (he : e.val ∈ selectorCenters)
    (hseven : 7 ∈ row d) (hnine : 9 ∈ row d)
    (hsix : 6 ∉ row d) (height : 8 ∉ row d) :
    evalClauseD (nextRowAssign cell blocker row d)
      (selectorRowClause cell e.val) = true := by
  by_cases hed : e = d
  · subst e
    have hxmem := selected_xVar_mem_eligibleRowVars hrow
      hseven hnine hsix height
    have hlit :
        Int.ofNat (SafeCoverCnf.xVar d.val
          (SafeCoverIndexBridge.coverIndex row d.val)) ∈
          (eligibleRowVars d.val).map Int.ofNat :=
      List.mem_map.mpr ⟨_, hxmem, rfl⟩
    simp only [selectorRowClause, evalClauseD, List.any_eq_true]
    refine ⟨_, List.mem_cons_of_mem _ hlit, ?_⟩
    rw [evalLitD_pos]
    · exact nextRowAssign_selected_xVar cell blocker hrow d
    · exact SafeCoverCnf.one_le_xVar _ _
  · simp only [selectorRowClause, evalClauseD, List.any_cons]
    rw [evalLitD_negNat,
      nextRowAssign_not_selected cell blocker row d e hd he hed]
    simp

/-- If the semantic distinguished center differs from a physical blocker,
the corresponding blocker input is false in the successor assignment. -/
theorem nextRowAssign_blockerVar_eq_false_at_selected
    (cell : FrozenNextRowCell) {row : RowPattern Label}
    {blocker : Fin 5 → Label}
    (hadded : FrozenNextRowOnlyHitAddedConstraintsHold row blocker
      (cell.1 : Label × Label).1 (cell.1 : Label × Label).2)
    (d : Label) (i : Fin 5)
    (hcenter : d.val ∈ blockerCenters
      ((physicalSources (canonicalV14Coordinate cell)).getD i.val 0))
    (hne : d ≠ blocker i) :
    nextRowAssign cell blocker row d
        (blockerVar (canonicalV14Coordinate cell) i d.val) = false := by
  have hleSource := blockerVar_le_sourceBlocksEnd
    (canonicalV14Coordinate cell) i hcenter
  have hleFinal :
      blockerVar (canonicalV14Coordinate cell) i d.val ≤
        finalNumVars (canonicalV14Coordinate cell) := by
    rw [sourceBlocksEnd_eq] at hleSource
    rw [FrozenV14JobCnf.finalNumVars_eq]
    omega
  rw [nextRowAssign_low cell blocker row d hleFinal]
  apply Bool.eq_false_of_not_eq_true
  intro htrue
  have heq := (v14Assign_blockerVar_eq_true_iff
    (canonicalV14Coordinate cell)
    (frozenPhysicalCycleCnfAddedConstraintsHold_of_nextRowOnlyHit hadded)
    (SafeCoverIndexBridge.coverIndex row) i hcenter).1 htrue
  exact hne (Fin.ext heq)

/-- The chosen next-row witness satisfies one selector-guarded blocker
exclusion. -/
theorem nextRowAssign_sat_selectorBlockerClause
    (cell : FrozenNextRowCell) {row : RowPattern Label}
    {blocker : Fin 5 → Label}
    (hadded : FrozenNextRowOnlyHitAddedConstraintsHold row blocker
      (cell.1 : Label × Label).1 (cell.1 : Label × Label).2)
    (d e : Label) (hd : d.val ∈ selectorCenters)
    (he : e.val ∈ selectorCenters) (i : Fin 5)
    (hcenter : e.val ∈ blockerCenters
      ((physicalSources (canonicalV14Coordinate cell)).getD i.val 0))
    (hne : d ≠ blocker i) :
    evalClauseD (nextRowAssign cell blocker row d)
      [-Int.ofNat (selectorVar cell e.val),
        -Int.ofNat (blockerVar (canonicalV14Coordinate cell) i e.val)] =
      true := by
  by_cases hed : e = d
  · subst e
    simp only [evalClauseD, List.any_cons, evalLitD_negNat]
    rw [nextRowAssign_selected cell blocker row d hd,
      nextRowAssign_blockerVar_eq_false_at_selected cell hadded d i hcenter hne]
    simp
  · simp only [evalClauseD, List.any_cons, evalLitD_negNat]
    rw [nextRowAssign_not_selected cell blocker row d e hd he hed]
    simp

/-- The selected input witnesses the selector at-least-one clause. -/
theorem nextRowAssign_sat_selectorAtLeastOne
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label)
    (row : RowPattern Label) (d : Label)
    (hd : d.val ∈ selectorCenters) :
    evalClauseD (nextRowAssign cell blocker row d)
      ((selectorVars cell).map Int.ofNat) = true := by
  simp only [evalClauseD, List.any_eq_true]
  refine ⟨Int.ofNat (selectorVar cell d.val), ?_, ?_⟩
  · exact List.mem_map.mpr ⟨selectorVar cell d.val,
      List.mem_map.mpr ⟨d.val, hd, rfl⟩, rfl⟩
  · rw [evalLitD_pos]
    · exact nextRowAssign_selected cell blocker row d hd
    · simp only [selectorVar]
      omega

/-- The canonical successor extension satisfies the selector's bound-one
Sinz clauses. -/
theorem nextRowAssign_sat_selectorSinz
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label)
    (row : RowPattern Label) (d : Label)
    (hd : d.val ∈ selectorCenters) :
    ∀ c ∈ sinzClauses (selectorVars cell) 1 (selectorSinzBase cell),
      evalClauseD (nextRowAssign cell blocker row d) c = true := by
  apply sinz_sat
  · decide
  · rw [selectorAssign_filter_length_eq_one cell d hd]
  · intro v hv
    rw [selectorVars_eq] at hv
    rw [selectorSinzBase_eq]
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hv
    omega

/-- The chosen witness satisfies both optional selector-guarded blocker
clauses emitted for one candidate center. -/
theorem nextRowAssign_sat_selectorBlockerClauses
    (cell : FrozenNextRowCell) {row : RowPattern Label}
    {blocker : Fin 5 → Label}
    (hadded : FrozenNextRowOnlyHitAddedConstraintsHold row blocker
      (cell.1 : Label × Label).1 (cell.1 : Label × Label).2)
    (d e : Label) (hd : d.val ∈ selectorCenters)
    (he : e.val ∈ selectorCenters)
    (hneTwo : d ≠ blocker 2) (hneThree : d ≠ blocker 3) :
    ∀ c ∈ selectorBlockerClauses cell e.val,
      evalClauseD (nextRowAssign cell blocker row d) c = true := by
  intro c hc
  by_cases htwo : e.val ∈
      blockerCenters ((physicalSources (canonicalV14Coordinate cell)).getD 2 0)
  · by_cases hthree : e.val ∈
        blockerCenters ((physicalSources (canonicalV14Coordinate cell)).getD 3 0)
    · simp only [selectorBlockerClauses, htwo, hthree, if_true,
        List.mem_append, List.mem_cons, List.not_mem_nil, or_false] at hc
      rcases hc with rfl | rfl
      · exact nextRowAssign_sat_selectorBlockerClause cell hadded d e hd he
          2 htwo hneTwo
      · exact nextRowAssign_sat_selectorBlockerClause cell hadded d e hd he
          3 hthree hneThree
    · simp only [selectorBlockerClauses, htwo, hthree, if_true, if_false,
        List.append_nil, List.mem_cons, List.not_mem_nil, or_false] at hc
      subst c
      exact nextRowAssign_sat_selectorBlockerClause cell hadded d e hd he
        2 htwo hneTwo
  · by_cases hthree : e.val ∈
        blockerCenters ((physicalSources (canonicalV14Coordinate cell)).getD 3 0)
    · simp only [selectorBlockerClauses, htwo, hthree, if_true, if_false,
        List.nil_append, List.mem_cons, List.not_mem_nil, or_false] at hc
      subst c
      exact nextRowAssign_sat_selectorBlockerClause cell hadded d e hd he
        3 hthree hneThree
    · change e.val ∉ blockerCenters
          ((physicalSources (canonicalV14Coordinate cell))[2]?.getD 0) at htwo
      change e.val ∉ blockerCenters
          ((physicalSources (canonicalV14Coordinate cell))[3]?.getD 0) at hthree
      simp [selectorBlockerClauses, htwo, hthree] at hc

/-- Every source model of the next-row dichotomy supplies a canonical
assignment satisfying the complete job-specific selector suffix. -/
theorem exists_nextRowAssign_sat_nextRowOnlyHitClauseDelta
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenNextRowCell) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowOnlyHitAddedConstraintsHold row blocker
      (cell.1 : Label × Label).1 (cell.1 : Label × Label).2) :
    ∃ d : Label, ∀ c ∈ nextRowOnlyHitClauseDelta cell,
      evalClauseD (nextRowAssign cell blocker row d) c = true := by
  have hsemantic := hadded
  rcases hsemantic with
    ⟨_hrowOne, _hrowSeven, hinjective, _hblockerU, _hblockerXv,
      _hneSource, _hneOne, _hrowTrace,
      ⟨d, hone, hsevenLabel, hseven, hnine, hsix, height, hbranch⟩⟩
  have hd : d.val ∈ selectorCenters :=
    mem_selectorCenters_of_ne_one_ne_seven hone hsevenLabel
  have hmiddle := nextRowDichotomy_witness_ne_middleBlockers
    hinjective hbranch
  refine ⟨d, ?_⟩
  intro c hc
  simp only [nextRowOnlyHitClauseDelta, List.mem_append] at hc
  rcases hc with (hselectors | hatLeastOne) | hsinz
  · rw [List.mem_flatMap] at hselectors
    obtain ⟨e, heNat, hc⟩ := hselectors
    have heLt : e < 12 := by
      simp [selectorCenters] at heNat
      omega
    let eLabel : Label := ⟨e, heLt⟩
    have he : eLabel.val ∈ selectorCenters := by
      exact heNat
    simp only [List.mem_append, List.mem_cons, List.not_mem_nil,
      or_false] at hc
    rcases hc with rfl | hblocker
    · exact nextRowAssign_sat_selectorRowClause cell blocker hrow d eLabel
        hd he hseven hnine hsix height
    · exact nextRowAssign_sat_selectorBlockerClauses cell hadded d eLabel
        hd he hmiddle.1 hmiddle.2 c hblocker
  · simp only [List.mem_cons, List.not_mem_nil, or_false] at hatLeastOne
    subst c
    exact nextRowAssign_sat_selectorAtLeastOne cell blocker row d hd
  · exact nextRowAssign_sat_selectorSinz cell blocker row d hd c hsinz

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
/-- Every common-prefix literal lies in the variable interval preserved by the
successor assignment.  This is a finite check of the exact frozen layout. -/
theorem commonPhysicalCycleClauseDelta_lit_bound
    (cell : FrozenNextRowCell) :
    ∀ c ∈ commonPhysicalCycleClauseDelta (canonicalV14Coordinate cell),
      ∀ l ∈ c, l.natAbs ≤ finalNumVars (canonicalV14Coordinate cell) := by
  revert cell
  native_decide

/-- Every literal in the complete reconstructed delta lies below the exact
42,730-variable ceiling. -/
theorem reconstructedClauseDelta_lit_bound (cell : FrozenNextRowCell) :
    ∀ c ∈ reconstructedClauseDelta cell, ∀ l ∈ c,
      l.natAbs ≤ nextRowFinalNumVars cell := by
  intro c hc l hl
  rcases List.mem_append.mp hc with hcommon | hsuffix
  · have hbound := commonPhysicalCycleClauseDelta_lit_bound
      cell c hcommon l hl
    rw [FrozenV14JobCnf.finalNumVars_eq] at hbound
    rw [nextRowFinalNumVars_eq]
    omega
  · exact nextRowOnlyHitClauseDelta_lit_bound cell c hsuffix l hl

/-- The complete successor assignment satisfies every clause in the shared
physical-cycle prefix. -/
theorem nextRowAssign_sat_commonPhysicalCycleClauseDelta
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenNextRowCell) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowOnlyHitAddedConstraintsHold row blocker
      (cell.1 : Label × Label).1 (cell.1 : Label × Label).2)
    (d : Label) {c : List Int}
    (hc : c ∈ commonPhysicalCycleClauseDelta (canonicalV14Coordinate cell)) :
    evalClauseD (nextRowAssign cell blocker row d) c = true := by
  have hprefix :=
    frozenPhysicalCycleCnfAddedConstraintsHold_of_nextRowOnlyHit hadded
  calc
    evalClauseD (nextRowAssign cell blocker row d) c =
        evalClauseD
          (v14Assign (canonicalV14Coordinate cell) blocker
            (SafeCoverIndexBridge.coverIndex row)) c := by
      apply SafeCoverCnf.evalClauseD_congr
      intro l hl
      exact nextRowAssign_low cell blocker row d
        (commonPhysicalCycleClauseDelta_lit_bound cell c hc l hl)
    _ = true :=
      v14Assign_sat_commonPhysicalCycleClauseDelta
        (canonicalV14Coordinate cell) hrow hprefix hc

/-- Source-faithful next-row semantics produce one assignment satisfying the
entire ordered common-prefix-plus-selector clause delta. -/
theorem exists_nextRowAssign_sat_reconstructedClauseDelta
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenNextRowCell) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowOnlyHitAddedConstraintsHold row blocker
      (cell.1 : Label × Label).1 (cell.1 : Label × Label).2) :
    ∃ d : Label, ∀ c ∈ reconstructedClauseDelta cell,
      evalClauseD (nextRowAssign cell blocker row d) c = true := by
  obtain ⟨d, hsuffix⟩ :=
    exists_nextRowAssign_sat_nextRowOnlyHitClauseDelta cell hrow hadded
  refine ⟨d, ?_⟩
  intro c hc
  rcases List.mem_append.mp hc with hcommon | hsuffixMem
  · exact nextRowAssign_sat_commonPhysicalCycleClauseDelta
      cell hrow hadded d hcommon
  · exact hsuffix c hsuffixMem

end FrozenNextRowJobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
