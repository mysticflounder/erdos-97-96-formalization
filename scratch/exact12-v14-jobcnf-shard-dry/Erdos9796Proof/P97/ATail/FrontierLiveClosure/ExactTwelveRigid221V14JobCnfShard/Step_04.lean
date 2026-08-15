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

theorem v14Assign_sat_namedDeletionArmClauses
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1) :
    ∀ c ∈ namedDeletionArmClauses cell,
      evalClauseD
        (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c =
          true := by
  intro c hc
  simp only [namedDeletionArmClauses, List.mem_flatMap] at hc
  obtain ⟨center, hcenter, hc⟩ := hc
  exact v14Assign_sat_namedDeletionCenterClauses cell hrow hadded hcenter c hc

/-- The positive distinguished-`d` selector clause, in candidate-table order:
the selected row at `d` contains `7` and omits `9`. -/
def distinguishedDEligibleClause (cell : FrozenV14JobCoordinate) : List Int :=
  (varsMatching cell.2.2.1.val fun m =>
    m.testBit (7 : Label).val && !(m.testBit (9 : Label).val)).map Int.ofNat

/-- The distinguished label cannot be the blocker of the physical source `9`.
For `d = 9` that blocker input does not exist and the compiler emits no unit. -/
def distinguishedDBlockerClauses (cell : FrozenV14JobCoordinate) :
    List (List Int) :=
  if cell.2.2.1.val = 9 then []
  else [[-Int.ofNat (blockerVar cell 1 cell.2.2.1.val)]]

/-- Candidate indices at `d` containing both `1` and `6`. -/
def distinguishedDLeftIndices (cell : FrozenV14JobCoordinate) : List Nat :=
  candidateIndicesMatching cell.2.2.1.val fun m =>
    m.testBit (1 : Label).val && m.testBit (6 : Label).val

/-- Candidate indices at `7` containing both `1` and `d`. -/
def distinguishedDRightIndices (cell : FrozenV14JobCoordinate) : List Nat :=
  candidateIndicesMatching (7 : Label).val fun m =>
    m.testBit (1 : Label).val && m.testBit cell.2.2.1.val

/-- One forbidden pair in the distinguished-`d` arm. -/
def distinguishedDPairClause (cell : FrozenV14JobCoordinate)
    (left right : Nat) : List Int :=
  [-Int.ofNat (SafeCoverCnf.xVar cell.2.2.1.val left),
    -Int.ofNat (SafeCoverCnf.xVar (7 : Label).val right)]

/-- The compiler emits the left-major Cartesian product of forbidden row pairs
exactly when `d` belongs to the fixed row at center `1`. -/
def distinguishedDPairClauses (cell : FrozenV14JobCoordinate) :
    List (List Int) :=
  if cell.2.2.1 ∈ frozenRowAtOne
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2 then
    (distinguishedDLeftIndices cell).flatMap fun left =>
      (distinguishedDRightIndices cell).map fun right =>
        distinguishedDPairClause cell left right
  else []

/-- Complete distinguished-`d` family in compiler order: the positive selector,
optional blocker unit, then the optional left-major forbidden-pair product. -/
def distinguishedDClauses (cell : FrozenV14JobCoordinate) :
    List (List Int) :=
  distinguishedDEligibleClause cell ::
    (distinguishedDBlockerClauses cell ++ distinguishedDPairClauses cell)

/-- The semantic distinguished row supplies a true literal to its positive
eligible-row clause. -/
theorem v14Assign_sat_distinguishedDEligibleClause
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1) :
    evalClauseD
      (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row))
      (distinguishedDEligibleClause cell) = true := by
  let d : Label := cell.2.2.1
  let selected := SafeCoverIndexBridge.coverIndex row d.val
  rcases hadded.2.2.2.2.2.2.2.2.2 with
    ⟨_hd1, _hd7, _hd8, h7row, h9row, _hblocker, _hmissing⟩
  have hi : selected < SafeCoverCnf.candCount d.val :=
    SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow d.isLt
  have h7bit :
      ((SafeCoverCnf.candMasks d.val).getD selected 0).testBit
          (7 : Label).val = true := by
    dsimp only [selected]
    rw [SafeCoverIndexBridge.coverIndex_testBit_of_safeCubeOK hrow d (7 : Label)]
    exact decide_eq_true h7row
  have h9bit :
      ((SafeCoverCnf.candMasks d.val).getD selected 0).testBit
          (9 : Label).val = false := by
    dsimp only [selected]
    rw [SafeCoverIndexBridge.coverIndex_testBit_of_safeCubeOK hrow d (9 : Label)]
    exact decide_eq_false h9row
  have hpredicate :
      (((SafeCoverCnf.candMasks d.val).getD selected 0).testBit
          (7 : Label).val &&
        !(((SafeCoverCnf.candMasks d.val).getD selected 0).testBit
          (9 : Label).val)) = true := by
    rw [Bool.and_eq_true]
    exact ⟨h7bit, by simp only [h9bit, Bool.not_false]⟩
  have hnat : SafeCoverCnf.xVar d.val selected ∈
      varsMatching d.val (fun m =>
        m.testBit (7 : Label).val && !(m.testBit (9 : Label).val)) :=
    xVar_mem_varsMatching hi hpredicate
  have hint : Int.ofNat (SafeCoverCnf.xVar d.val selected) ∈
      distinguishedDEligibleClause cell := by
    apply List.mem_map.mpr
    exact ⟨SafeCoverCnf.xVar d.val selected, hnat, rfl⟩
  simp only [evalClauseD, List.any_eq_true]
  refine ⟨Int.ofNat (SafeCoverCnf.xVar d.val selected), hint, ?_⟩
  rw [evalLitD_pos]
  · exact (v14Assign_xVar_eq_true_iff cell blocker
      (SafeCoverIndexBridge.coverIndex row)
      (fun _ hp => SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow hp)
      d.isLt hi).2 rfl
  · exact SafeCoverCnf.one_le_xVar _ _

/-- Every optional distinguished-`d` blocker unit is true under the semantic
blocker assignment. -/
theorem v14Assign_sat_distinguishedDBlockerClauses
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1) :
    ∀ c ∈ distinguishedDBlockerClauses cell,
      evalClauseD
        (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c =
          true := by
  intro c hc
  let d : Label := cell.2.2.1
  rcases hadded.2.2.2.2.2.2.2.2.2 with
    ⟨hd1, _hd7, _hd8, _h7row, _h9row, hblocker, _hmissing⟩
  by_cases hd9 : d.val = 9
  · simp [distinguishedDBlockerClauses, d, hd9] at hc
  · have hcenter : d.val ∈
        blockerCenters ((physicalSources cell).getD (1 : Fin 5).val 0) := by
      apply List.mem_filter.mpr
      refine ⟨List.mem_range.mpr d.isLt, ?_⟩
      simp only [physicalSources, List.getD_cons_succ, List.getD_cons_zero,
        Bool.and_eq_true, bne_iff_ne]
      constructor
      · exact hd9
      · intro hdOne
        apply hd1
        apply Fin.ext
        exact hdOne
    have hfalse :
        v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)
            (blockerVar cell 1 d.val) = false := by
      apply Bool.eq_false_of_not_eq_true
      intro htrue
      have heq := (v14Assign_blockerVar_eq_true_iff cell
        (frozenPhysicalCycleCnfAddedConstraintsHold_of_v14 hadded)
        (SafeCoverIndexBridge.coverIndex row) 1 hcenter).1 htrue
      apply hblocker
      apply Fin.ext
      exact heq.symm
    simp only [distinguishedDBlockerClauses, d, if_neg hd9,
      List.mem_cons, List.not_mem_nil, or_false] at hc
    subst c
    have hfalse' :
        v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)
            (blockerVar cell 1 cell.2.2.1.val) = false := by
      simpa only [d] using hfalse
    simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false,
      evalLitD_negNat, hfalse', Bool.not_false]

/-- One forbidden distinguished-`d` pair clause is true under the canonical
source assignment. -/
theorem v14Assign_sat_distinguishedDPairClause
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
    (hactive : cell.2.2.1 ∈ frozenRowAtOne
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    {left right : Nat}
    (hleft : left ∈ distinguishedDLeftIndices cell)
    (hright : right ∈ distinguishedDRightIndices cell) :
    evalClauseD
      (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row))
      (distinguishedDPairClause cell left right) = true := by
  let d : Label := cell.2.2.1
  have hleftMem := List.mem_filter.mp hleft
  have hrightMem := List.mem_filter.mp hright
  have hleftLt : left < SafeCoverCnf.candCount d.val :=
    List.mem_range.mp hleftMem.1
  have hrightLt : right < SafeCoverCnf.candCount (7 : Label).val :=
    List.mem_range.mp hrightMem.1
  have hleftBits :
      ((SafeCoverCnf.candMasks d.val).getD left 0).testBit
          (1 : Label).val = true ∧
        ((SafeCoverCnf.candMasks d.val).getD left 0).testBit
          (6 : Label).val = true := by
    simpa only [Bool.and_eq_true] using hleftMem.2
  have hrightBits :
      ((SafeCoverCnf.candMasks (7 : Label).val).getD right 0).testBit
          (1 : Label).val = true ∧
        ((SafeCoverCnf.candMasks (7 : Label).val).getD right 0).testBit
          d.val = true := by
    simpa only [Bool.and_eq_true] using hrightMem.2
  rcases hadded.2.2.2.2.2.2.2.2.2 with
    ⟨_hd1, _hd7, _hd8, _h7row, _h9row, _hblocker, hmissing⟩
  by_cases hxleft :
      v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)
        (SafeCoverCnf.xVar d.val left) = true
  · have hleftEq := (v14Assign_xVar_eq_true_iff cell blocker
      (SafeCoverIndexBridge.coverIndex row)
      (fun _ hp => SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow hp)
      d.isLt hleftLt).1 hxleft
    have hrightFalse :
        v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)
            (SafeCoverCnf.xVar (7 : Label).val right) = false := by
      apply Bool.eq_false_of_not_eq_true
      intro hxright
      have hrightEq := (v14Assign_xVar_eq_true_iff cell blocker
        (SafeCoverIndexBridge.coverIndex row)
        (fun _ hp => SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow hp)
        (7 : Label).isLt hrightLt).1 hxright
      have hdRowOne : d ∈ row 1 := by
        rw [hadded.1]
        exact hactive
      have h1RowD := hleftBits.1
      rw [hleftEq,
        SafeCoverIndexBridge.coverIndex_testBit_of_safeCubeOK hrow d (1 : Label)]
        at h1RowD
      have h6RowD := hleftBits.2
      rw [hleftEq,
        SafeCoverIndexBridge.coverIndex_testBit_of_safeCubeOK hrow d (6 : Label)]
        at h6RowD
      have h1RowSeven := hrightBits.1
      rw [hrightEq,
        SafeCoverIndexBridge.coverIndex_testBit_of_safeCubeOK hrow (7 : Label)
          (1 : Label)] at h1RowSeven
      have hdRowSeven := hrightBits.2
      rw [hrightEq,
        SafeCoverIndexBridge.coverIndex_testBit_of_safeCubeOK hrow (7 : Label) d]
        at hdRowSeven
      exact hmissing ⟨hdRowOne, of_decide_eq_true h1RowD,
        of_decide_eq_true h6RowD, of_decide_eq_true h1RowSeven,
        of_decide_eq_true hdRowSeven⟩
    have hxleft' :
        v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)
            (SafeCoverCnf.xVar cell.2.2.1.val left) = true := by
      simpa only [d] using hxleft
    simp only [distinguishedDPairClause, evalClauseD, List.any_cons,
      List.any_nil, Bool.or_false, evalLitD_negNat, hxleft', hrightFalse,
      Bool.not_true, Bool.not_false, Bool.true_or, Bool.or_true]
  · have hxleftFalse := Bool.eq_false_of_not_eq_true hxleft
    have hxleftFalse' :
        v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)
            (SafeCoverCnf.xVar cell.2.2.1.val left) = false := by
      simpa only [d] using hxleftFalse
    simp only [distinguishedDPairClause, evalClauseD, List.any_cons,
      evalLitD_negNat, hxleftFalse', Bool.not_false, Bool.true_or]

/-- Every optional forbidden-pair clause is true under the canonical source
assignment. -/
theorem v14Assign_sat_distinguishedDPairClauses
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1) :
    ∀ c ∈ distinguishedDPairClauses cell,
      evalClauseD
        (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c =
          true := by
  intro c hc
  by_cases hactive : cell.2.2.1 ∈ frozenRowAtOne
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
  · simp only [distinguishedDPairClauses, if_pos hactive,
      List.mem_flatMap] at hc
    obtain ⟨left, hleft, hc⟩ := hc
    obtain ⟨right, hright, rfl⟩ := List.mem_map.mp hc
    exact v14Assign_sat_distinguishedDPairClause cell hrow hadded hactive
      hleft hright
  · simp [distinguishedDPairClauses, hactive] at hc

/-- The canonical source assignment satisfies the complete distinguished-`d`
clause family reconstructed in compiler order. -/
theorem v14Assign_sat_distinguishedDClauses
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1) :
    ∀ c ∈ distinguishedDClauses cell,
      evalClauseD
        (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c =
          true := by
  intro c hc
  have hc' : c = distinguishedDEligibleClause cell ∨
      c ∈ distinguishedDBlockerClauses cell ++ distinguishedDPairClauses cell := by
    simpa only [distinguishedDClauses, List.mem_cons] using hc
  rcases hc' with hc | hc
  · subst c
    exact v14Assign_sat_distinguishedDEligibleClause cell hrow hadded
  · rcases List.mem_append.mp hc with hc | hc
    · exact v14Assign_sat_distinguishedDBlockerClauses cell hrow hadded c hc
    · exact v14Assign_sat_distinguishedDPairClauses cell hrow hadded c hc

/-- At-least-one blocker clause emitted after the ten implications of one
physical source. -/
def sourceSelectorClause (cell : FrozenV14JobCoordinate) (i : Fin 5) :
    List Int :=
  (sourceBlockerVars cell i).map Int.ofNat

/-- The selected semantic blocker satisfies its source's at-least-one
selector clause. -/
theorem v14Assign_sat_sourceSelectorClause
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (idx : Nat → Nat) (i : Fin 5) :
    evalClauseD (v14Assign cell blocker idx)
      (sourceSelectorClause cell i) = true := by
  have hcenter := blocker_mem_blockerCenters_of_addedConstraints cell hadded i
  simp only [evalClauseD, List.any_eq_true]
  refine ⟨Int.ofNat (blockerVar cell i (blocker i).val), ?_, ?_⟩
  · apply List.mem_map.mpr
    exact ⟨blockerVar cell i (blocker i).val,
      List.mem_map.mpr ⟨(blocker i).val, hcenter, rfl⟩, rfl⟩
  · rw [evalLitD_pos]
    · exact (v14Assign_blockerVar_eq_true_iff cell hadded idx i hcenter).2 rfl
    · have hvar := baseNumVars_lt_blockerVar cell i (blocker i).val
      omega

/-- The two positive units emitted by the compiler after the five source
blocks, fixing the `6`-source blocker at `8` and the `8`-source blocker at
`7`. -/
def forcedBlockerClauses (cell : FrozenV14JobCoordinate) : List (List Int) :=
  [[Int.ofNat (blockerVar cell 0 8)],
    [Int.ofNat (blockerVar cell 4 7)]]

/-- The semantic forced-blocker equalities satisfy both compiler units. -/
theorem v14Assign_sat_forcedBlockerClauses
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (idx : Nat → Nat) :
    ∀ c ∈ forcedBlockerClauses cell,
      evalClauseD (v14Assign cell blocker idx) c = true := by
  have hblockerU : blocker 0 = 8 := hadded.2.2.2.1
  have hblockerXv : blocker 4 = 7 := hadded.2.2.2.2.1
  intro c hc
  simp only [forcedBlockerClauses, List.mem_cons, List.not_mem_nil,
    or_false] at hc
  rcases hc with rfl | rfl
  · simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false]
    rw [evalLitD_pos]
    · have htrue := v14Assign_selectedBlockerVar_eq_true cell hadded idx 0
      simpa [hblockerU] using htrue
    · have hvar := baseNumVars_lt_blockerVar cell 0 8
      omega
  · simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false]
    rw [evalLitD_pos]
    · have htrue := v14Assign_selectedBlockerVar_eq_true cell hadded idx 4
      simpa [hblockerXv] using htrue
    · have hvar := baseNumVars_lt_blockerVar cell 4 7
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

/- ## Ordered complete clause-delta reconstruction -/

/-- The two clauses emitted before the physical-source blocks. -/
def initialClauses (cell : FrozenV14JobCoordinate) : List (List Int) :=
  [centerOneExactRowClause cell, centerSevenPhysicalIntersectionClause cell]

/-- One complete physical-source block in compiler order: ten implications,
the at-least-one selector, then the source-wise bound-one Sinz clauses. -/
def sourceBlockClauses (cell : FrozenV14JobCoordinate) (i : Fin 5) :
    List (List Int) :=
  sourceImplicationClauses cell i ++
    ([sourceSelectorClause cell i] ++
      sinzClauses (sourceBlockerVars cell i) 1 (sourceSinzBase cell i))

/-- The five physical-source blocks in source insertion order. -/
def allSourceBlockClauses (cell : FrozenV14JobCoordinate) : List (List Int) :=
  (List.finRange 5).flatMap (sourceBlockClauses cell)

/-- The twelve center-wise bound-one Sinz blocks in increasing-center order. -/
def allCenterSinzClauses (cell : FrozenV14JobCoordinate) : List (List Int) :=
  (List.range 12).flatMap fun center ↦
    sinzClauses (centerBlockerVars cell center) 1 (centerSinzBase cell center)

/-- Exact ordered clause prefix shared by the normalized-v14 and next-row-only
jobs: initial rows, five source blocks, forced blockers, and twelve center-wise
bound-one blocks.  The job-specific clauses begin after this list. -/
def commonPhysicalCycleClauseDelta (cell : FrozenV14JobCoordinate) :
    List (List Int) :=
  initialClauses cell ++
    (allSourceBlockClauses cell ++
      (forcedBlockerClauses cell ++ allCenterSinzClauses cell))

/-- Exact ordered reconstruction of the clauses appended by `compile_cell`:
initial row clauses, five source blocks, forced blockers, twelve center blocks,
the named-deletion arm, and the distinguished-`d` family. -/
def reconstructedClauseDelta (cell : FrozenV14JobCoordinate) :
    List (List Int) :=
  initialClauses cell ++
    (allSourceBlockClauses cell ++
      (forcedBlockerClauses cell ++
        (allCenterSinzClauses cell ++
          (namedDeletionArmClauses cell ++ distinguishedDClauses cell))))

/-- The final center-wise extension preserves satisfaction of every clause in
one source-wise Sinz block. -/
theorem v14Assign_sat_sourceSinzClause
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (i : Fin 5) {c : List Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell i) 1
      (sourceSinzBase cell i)) :
    evalClauseD
      (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c = true := by
  rw [v14Assign, Census554.CoverCnf.evalClauseD_congr
    (σ' := sourceSinzAssign cell
      (blockerAssign cell blocker
        (SafeCoverCnf.finalAssign (SafeCoverIndexBridge.coverIndex row))))]
  · exact sourceSinzAssign_sat_source cell hadded
      (SafeCoverCnf.finalAssign (SafeCoverIndexBridge.coverIndex row)) i hc
  · intro l hl
    apply centerSinzAssign_low
    have hbound := Census554.CoverCnf.sinzClauses_lit_bound
      (sourceBlockerVars cell i) 1 (sourceSinzBase cell i) (by decide)
      (fun v hv ↦ sourceBlockerVars_le_sourceSinzBase cell i hv) c hc l hl
    have hend :
        sourceSinzBase cell i + (sourceBlockerVars cell i).length ≤
          sourceBlocksEnd cell := by
      rw [sourceSinzEnd_eq, sourceBlocksEnd_eq, SafeCoverCnf.baseNumVars_eq]
      omega
    exact le_trans (by simpa using hbound) hend

/-- The canonical assignment satisfies the two initial compiler clauses. -/
theorem v14Assign_sat_initialClauses
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2) :
    ∀ c ∈ initialClauses cell,
      evalClauseD
        (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c = true := by
  intro c hc
  simp only [initialClauses, List.mem_cons, List.not_mem_nil, or_false] at hc
  rcases hc with hc | hc
  · subst c
    exact v14Assign_sat_centerOneExactRowClause cell hrow hadded
  · subst c
    exact v14Assign_sat_centerSevenPhysicalIntersectionClause cell hrow hadded

/-- The canonical assignment satisfies one complete source block. -/
theorem v14Assign_sat_sourceBlockClauses
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (i : Fin 5) :
    ∀ c ∈ sourceBlockClauses cell i,
      evalClauseD
        (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c = true := by
  intro c hc
  rcases List.mem_append.mp hc with hc | hc
  · exact v14Assign_sat_sourceImplicationClauses cell hrow hadded i c hc
  · rcases List.mem_append.mp hc with hc | hc
    · simp only [List.mem_singleton] at hc
      subst c
      exact v14Assign_sat_sourceSelectorClause cell hadded
        (SafeCoverIndexBridge.coverIndex row) i
    · exact v14Assign_sat_sourceSinzClause cell hadded i hc

/-- The canonical assignment satisfies all five source blocks. -/
theorem v14Assign_sat_allSourceBlockClauses
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2) :
    ∀ c ∈ allSourceBlockClauses cell,
      evalClauseD
        (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c = true := by
  intro c hc
  obtain ⟨i, _hi, hc⟩ := List.mem_flatMap.mp hc
  exact v14Assign_sat_sourceBlockClauses cell hrow hadded i c hc

/-- The canonical assignment satisfies all twelve center-wise Sinz blocks. -/
