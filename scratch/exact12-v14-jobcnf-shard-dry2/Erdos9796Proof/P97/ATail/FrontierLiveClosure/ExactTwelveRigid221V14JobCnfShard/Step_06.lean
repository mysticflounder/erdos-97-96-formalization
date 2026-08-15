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

theorem v14Assign_sat_sourceImplicationClause
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (i : Fin 5) {center : Nat}
    (hcenter : center ∈
      blockerCenters ((physicalSources cell).getD i.val 0)) :
    evalClauseD
      (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row))
      (sourceImplicationClause cell i center) = true := by
  by_cases hselected : center = (blocker i).val
  · subst center
    let selected := SafeCoverIndexBridge.coverIndex row (blocker i).val
    have hi : selected < SafeCoverCnf.candCount (blocker i).val :=
      SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow (blocker i).isLt
    have htrace :
        row (blocker i) ∩ frozenPhysicalLabels
            (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2 =
          frozenPhysicalEdges
            (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2 i :=
      hadded.2.2.2.2.2.2.2.1 i
    have hsourceEdge :
        frozenPhysicalSources
            (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2 i ∈
          frozenPhysicalEdges
            (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2 i := by
      fin_cases i <;>
        simp [frozenPhysicalSources, frozenPhysicalEdges]
    have hsourceRow :
        frozenPhysicalSources
            (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2 i ∈
          row (blocker i) := by
      have hsourceInter :
          frozenPhysicalSources
              (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2 i ∈
            row (blocker i) ∩ frozenPhysicalLabels
              (cell.1.1 : Label × Label).1
              (cell.1.1 : Label × Label).2 := by
        rw [htrace]
        exact hsourceEdge
      exact (Finset.mem_inter.mp hsourceInter).1
    have hmask :
        (SafeCoverCnf.candMasks (blocker i).val).getD selected 0 =
          SafeCoverIndexBridge.classMask (row (blocker i)) :=
      SafeCoverIndexBridge.getD_coverIndex_of_safeCubeOK hrow (blocker i)
    have hphysical :
        (SafeCoverCnf.candMasks (blocker i).val).getD selected 0 &&&
            SafeCoverIndexBridge.classMask
              (frozenPhysicalLabels
                (cell.1.1 : Label × Label).1
                (cell.1.1 : Label × Label).2) =
          SafeCoverIndexBridge.classMask
            (frozenPhysicalEdges
              (cell.1.1 : Label × Label).1
              (cell.1.1 : Label × Label).2 i) := by
      rw [hmask, SafeCoverIndexBridge.classMask_land_classMask]
      exact congrArg SafeCoverIndexBridge.classMask htrace
    have hsourceBit :
        ((SafeCoverCnf.candMasks (blocker i).val).getD selected 0).testBit
            (frozenPhysicalSources
              (cell.1.1 : Label × Label).1
              (cell.1.1 : Label × Label).2 i).val = true := by
      rw [hmask, SafeCoverIndexBridge.classMask_testBit]
      simp [hsourceRow]
    have hpredicate :
        (((SafeCoverCnf.candMasks (blocker i).val).getD selected 0).testBit
              ((physicalSources cell).getD i.val 0) &&
            (((SafeCoverCnf.candMasks (blocker i).val).getD selected 0 &&&
                SafeCoverIndexBridge.classMask
                  (frozenPhysicalLabels
                    (cell.1.1 : Label × Label).1
                    (cell.1.1 : Label × Label).2)) ==
              SafeCoverIndexBridge.classMask
                (frozenPhysicalEdges
                  (cell.1.1 : Label × Label).1
                  (cell.1.1 : Label × Label).2 i))) = true := by
      rw [physicalSources_getD_eq_frozen, hsourceBit]
      exact beq_iff_eq.mpr hphysical
    have hnat : SafeCoverCnf.xVar (blocker i).val selected ∈
        sourceAllowedVars cell i (blocker i).val :=
      xVar_mem_varsMatching hi hpredicate
    have htail : Int.ofNat (SafeCoverCnf.xVar (blocker i).val selected) ∈
        (sourceAllowedVars cell i (blocker i).val).map Int.ofNat :=
      List.mem_map.mpr
        ⟨SafeCoverCnf.xVar (blocker i).val selected, hnat, rfl⟩
    simp only [sourceImplicationClause, evalClauseD, List.any_eq_true]
    refine ⟨Int.ofNat (SafeCoverCnf.xVar (blocker i).val selected),
      List.mem_cons_of_mem _ htail, ?_⟩
    rw [evalLitD_pos]
    · exact (v14Assign_xVar_eq_true_iff cell blocker
        (SafeCoverIndexBridge.coverIndex row)
        (fun _ hp => SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow hp)
        (blocker i).isLt hi).2 rfl
    · exact SafeCoverCnf.one_le_xVar _ _
  · have hfalse :
        v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)
            (blockerVar cell i center) = false := by
      apply Bool.eq_false_of_not_eq_true
      intro htrue
      exact hselected
        ((v14Assign_blockerVar_eq_true_iff cell hadded
          (SafeCoverIndexBridge.coverIndex row) i hcenter).1 htrue)
    simp only [sourceImplicationClause, evalClauseD, List.any_cons]
    rw [evalLitD_negNat, hfalse]
    simp

/-- The canonical source assignment satisfies every implication in one
physical source block. -/
theorem v14Assign_sat_sourceImplicationClauses
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (i : Fin 5) :
    ∀ c ∈ sourceImplicationClauses cell i,
      evalClauseD
        (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c =
          true := by
  intro c hc
  obtain ⟨center, hcenter, rfl⟩ := List.mem_map.mp hc
  exact v14Assign_sat_sourceImplicationClause cell hrow hadded i hcenter

/-- One binary named-deletion clause forbidding a selected blocker row that
contains the arm's designated deletion label. -/
def namedDeletionBinaryClause (cell : FrozenV14JobCoordinate)
    (center k : Nat) : List Int :=
  [-Int.ofNat
      (blockerVar cell cell.2.1.blockerSourceIndex center),
    -Int.ofNat (SafeCoverCnf.xVar center k)]

/-- Clauses emitted at one blocker center for the selected named-deletion
arm: the center-`2` unit first, then binary clauses in candidate-table order. -/
def namedDeletionCenterClauses (cell : FrozenV14JobCoordinate)
    (center : Nat) : List (List Int) :=
  (if center = 2 then
      [[-Int.ofNat
        (blockerVar cell cell.2.1.blockerSourceIndex center)]]
    else []) ++
    (candidateIndicesMatching center fun m =>
      m.testBit cell.2.1.deletionLabel.val).map fun k =>
        namedDeletionBinaryClause cell center k

/-- Complete named-deletion arm clause family in the compiler's increasing
blocker-center order. -/
def namedDeletionArmClauses (cell : FrozenV14JobCoordinate) :
    List (List Int) :=
  (blockerCenters ((physicalSources cell).getD
      cell.2.1.blockerSourceIndex.val 0)).flatMap fun center =>
    namedDeletionCenterClauses cell center

/-- The selected named-deletion blocker is not center `2`, so its emitted
negative blocker unit is true. -/
theorem v14Assign_sat_namedDeletionCenterTwoUnit
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1) :
    evalClauseD
      (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row))
      [-Int.ofNat
        (blockerVar cell cell.2.1.blockerSourceIndex 2)] = true := by
  have hcenter : 2 ∈ blockerCenters ((physicalSources cell).getD
      cell.2.1.blockerSourceIndex.val 0) := by
    cases cell.2.1 <;>
      simp [FrozenNamedDeletionArm.blockerSourceIndex, blockerCenters,
        physicalSources]
  have harm : cell.2.1.Holds row blocker :=
    hadded.2.2.2.2.2.2.2.2.1
  have hfalse :
      v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)
          (blockerVar cell cell.2.1.blockerSourceIndex 2) = false := by
    apply Bool.eq_false_of_not_eq_true
    intro htrue
    have heq := (v14Assign_blockerVar_eq_true_iff cell
      (frozenPhysicalCycleCnfAddedConstraintsHold_of_v14 hadded)
      (SafeCoverIndexBridge.coverIndex row) cell.2.1.blockerSourceIndex
      hcenter).1 htrue
    apply harm.1
    apply Fin.ext
    exact heq.symm
  simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false,
    evalLitD_negNat, hfalse, Bool.not_false]

/-- Every binary clause emitted for one named-deletion blocker center is true
under the canonical source assignment. -/
theorem v14Assign_sat_namedDeletionBinaryClause
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
    {center k : Nat}
    (hcenter : center ∈ blockerCenters ((physicalSources cell).getD
      cell.2.1.blockerSourceIndex.val 0))
    (hk : k ∈ candidateIndicesMatching center fun m =>
      m.testBit cell.2.1.deletionLabel.val) :
    evalClauseD
      (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row))
      (namedDeletionBinaryClause cell center k) = true := by
  have hcenterLt : center < 12 := by
    have hmem := (List.mem_filter.mp hcenter).1
    exact List.mem_range.mp hmem
  have hkmem := List.mem_filter.mp hk
  have hkLt : k < SafeCoverCnf.candCount center :=
    List.mem_range.mp hkmem.1
  have hkBit :
      ((SafeCoverCnf.candMasks center).getD k 0).testBit
          cell.2.1.deletionLabel.val = true :=
    hkmem.2
  by_cases hselected : center = (blocker cell.2.1.blockerSourceIndex).val
  · subst center
    have harm : cell.2.1.Holds row blocker :=
      hadded.2.2.2.2.2.2.2.2.1
    have hxfalse :
        v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)
            (SafeCoverCnf.xVar
              (blocker cell.2.1.blockerSourceIndex).val k) = false := by
      apply Bool.eq_false_of_not_eq_true
      intro hxtrue
      have hkEq := (v14Assign_xVar_eq_true_iff cell blocker
        (SafeCoverIndexBridge.coverIndex row)
        (fun _ hp => SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow hp)
        (blocker cell.2.1.blockerSourceIndex).isLt hkLt).1 hxtrue
      have hselectedBit := hkBit
      rw [hkEq,
        SafeCoverIndexBridge.coverIndex_testBit_of_safeCubeOK hrow
          (blocker cell.2.1.blockerSourceIndex)
          cell.2.1.deletionLabel] at hselectedBit
      exact harm.2 (of_decide_eq_true hselectedBit)
    simp only [namedDeletionBinaryClause, evalClauseD, List.any_cons,
      List.any_nil, Bool.or_false, evalLitD_negNat, hxfalse,
      Bool.not_false, Bool.or_true]
  · have hblockerFalse :
        v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)
            (blockerVar cell cell.2.1.blockerSourceIndex center) = false := by
      apply Bool.eq_false_of_not_eq_true
      intro htrue
      exact hselected
        ((v14Assign_blockerVar_eq_true_iff cell
          (frozenPhysicalCycleCnfAddedConstraintsHold_of_v14 hadded)
          (SafeCoverIndexBridge.coverIndex row)
          cell.2.1.blockerSourceIndex hcenter).1 htrue)
    simp only [namedDeletionBinaryClause, evalClauseD, List.any_cons,
      evalLitD_negNat, hblockerFalse, Bool.not_false, Bool.true_or]

/-- Every clause emitted at one admissible named-deletion blocker center is
true under the canonical source assignment. -/
