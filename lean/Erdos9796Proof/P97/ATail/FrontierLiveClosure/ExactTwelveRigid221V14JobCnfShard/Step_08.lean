/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14SourceJobBridge
import Erdos9796Proof.P97.Census554.SinzSat
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step_07

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
  simp_rw [sourceBlockWidth_eq]
  norm_num [List.finRange]

set_option maxHeartbeats 1000000 in
-- The elevated budget covers twelve closed representative-placement reductions.
/-- The center-wise counters allocate fifty further variables. -/
theorem centerSinzVarCount_eq (cell : FrozenV14JobCoordinate) :
    ((List.range 12).map fun center =>
      sinzVarCount (centerBlockerVars cell center).length 1).sum = 50 := by
  rcases cell with ⟨⟨⟨jd, v⟩, hplacement⟩, arm, d⟩
  rw [← frozenSeparatedPlacementRepresentativeList_toFinset] at hplacement
  simp [frozenSeparatedPlacementRepresentativeList] at hplacement
  rcases hplacement with
      (⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ |
       ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ |
       ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩) <;>
    simp only [centerBlockerVars, blockerVar, sourceBlockBase_eq] <;>
    decide +revert

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

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
