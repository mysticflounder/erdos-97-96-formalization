/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowJobCnf

/-!
# Exact fixed-arm suffix for next-row named-deletion jobs

This module reconstructs the clause suffix appended by
`compile_arm_cell` after the historical next-row cell.  It deliberately keeps
the `12 × 6` arm schedule separate from the older V14 distinguished-`d`
schedule.

The result is a source-to-CNF valuation bridge for one finite arm cell.  It is
not aggregate arm coverage, terminal UNSAT, or closure of a live residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenNextRowNamedDeletionJobCnf

open Census554.CoverCnf
open Census554.EqualityCore
open SafeCoverCnf
open ExactTwelveCarrierIngress
open FrozenV14JobCnf
open FrozenNextRowJobCnf

/-- One normalized placement together with one fixed named-deletion arm. -/
abbrev FrozenNextRowArmCell := FrozenNextRowCell × FrozenNamedDeletionArm

/-- The shared blocker-variable layout depends only on the placement. -/
def blockerLayout (cell : FrozenNextRowArmCell) : FrozenV14JobCoordinate :=
  (cell.1, .uQ, ⟨(0 : Label), by decide⟩)

/-- One binary clause forbidding a selected blocker row containing the fixed
arm's deletion label. -/
def namedDeletionBinaryClause (cell : FrozenNextRowArmCell)
    (center k : Nat) : List Int :=
  [-Int.ofNat
      (blockerVar (blockerLayout cell) cell.2.blockerSourceIndex center),
    -Int.ofNat (SafeCoverCnf.xVar center k)]

/-- Clauses emitted at one blocker center, in Python compiler order. -/
def namedDeletionCenterClauses (cell : FrozenNextRowArmCell)
    (center : Nat) : List (List Int) :=
  (if center = 2 then
      [[-Int.ofNat
        (blockerVar (blockerLayout cell)
          cell.2.blockerSourceIndex center)]]
    else []) ++
    (candidateIndicesMatching center fun m =>
      m.testBit cell.2.deletionLabel.val).map fun k =>
        namedDeletionBinaryClause cell center k

/-- Complete fixed-arm suffix in increasing blocker-center order. -/
def namedDeletionArmClauseDelta (cell : FrozenNextRowArmCell) :
    List (List Int) :=
  (blockerCenters ((physicalSources (blockerLayout cell)).getD
      cell.2.blockerSourceIndex.val 0)).flatMap fun center =>
    namedDeletionCenterClauses cell center

set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
/-- Every fixed-arm literal lies inside the preserved next-row prefix. -/
theorem namedDeletionArmClauseDelta_lit_bound (cell : FrozenNextRowArmCell) :
    ∀ c ∈ namedDeletionArmClauseDelta cell, ∀ l ∈ c,
      l.natAbs ≤ nextRowFinalNumVars cell.1 := by
  native_decide

/-- The selected blocker is not center `2`, so the fixed-arm unit is true. -/
theorem nextRowAssign_sat_namedDeletionCenterTwoUnit
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenNextRowArmCell) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowFixedNamedDeletionArmAddedConstraintsHold
      row blocker (cell.1.1 : Label × Label).1
        (cell.1.1 : Label × Label).2 cell.2)
    (d : Label) :
    evalClauseD (nextRowAssign cell.1 blocker row d)
      [-Int.ofNat
        (blockerVar (blockerLayout cell) cell.2.blockerSourceIndex 2)] =
      true := by
  have hcenter : 2 ∈ blockerCenters ((physicalSources (blockerLayout cell)).getD
      cell.2.blockerSourceIndex.val 0) := by
    cases cell.2 <;>
      simp [FrozenNamedDeletionArm.blockerSourceIndex, blockerCenters,
        physicalSources, blockerLayout]
  have hne : (2 : Label) ≠ blocker cell.2.blockerSourceIndex := by
    intro heq
    exact hadded.2.1 heq.symm
  have hfalse := nextRowAssign_blockerVar_eq_false_at_selected
    cell.1 hadded.1 (2 : Label) cell.2.blockerSourceIndex hcenter hne
  simpa [evalClauseD] using hfalse

/-- Every binary fixed-arm clause is true under the canonical successor
assignment. -/
theorem nextRowAssign_sat_namedDeletionBinaryClause
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenNextRowArmCell) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowFixedNamedDeletionArmAddedConstraintsHold
      row blocker (cell.1.1 : Label × Label).1
        (cell.1.1 : Label × Label).2 cell.2)
    (d : Label) {center k : Nat}
    (hcenter : center ∈ blockerCenters
      ((physicalSources (blockerLayout cell)).getD
        cell.2.blockerSourceIndex.val 0))
    (hk : k ∈ candidateIndicesMatching center fun m =>
      m.testBit cell.2.deletionLabel.val) :
    evalClauseD (nextRowAssign cell.1 blocker row d)
      (namedDeletionBinaryClause cell center k) = true := by
  have hcenterLt : center < 12 := by
    exact List.mem_range.mp (List.mem_filter.mp hcenter).1
  have hkmem := List.mem_filter.mp hk
  have hkLt : k < SafeCoverCnf.candCount center :=
    List.mem_range.mp hkmem.1
  have hkBit :
      ((SafeCoverCnf.candMasks center).getD k 0).testBit
          cell.2.deletionLabel.val = true := hkmem.2
  by_cases hselected : center = (blocker cell.2.blockerSourceIndex).val
  · subst center
    have hxbase : SafeCoverCnf.xVar
        (blocker cell.2.blockerSourceIndex).val k ≤
        SafeCoverCnf.baseNumVars :=
      (SafeCoverCnf.xVar_le_nX
        (blocker cell.2.blockerSourceIndex).isLt hkLt).trans (by
          rw [SafeCoverCnf.nX_eq, SafeCoverCnf.baseNumVars_eq]
          omega)
    have hxlow : SafeCoverCnf.xVar
        (blocker cell.2.blockerSourceIndex).val k ≤
        finalNumVars (canonicalV14Coordinate cell.1) := by
      rw [FrozenV14JobCnf.finalNumVars_eq]
      exact hxbase.trans (by rw [SafeCoverCnf.baseNumVars_eq]; omega)
    have hxfalse :
        nextRowAssign cell.1 blocker row d
            (SafeCoverCnf.xVar
              (blocker cell.2.blockerSourceIndex).val k) = false := by
      rw [nextRowAssign_low cell.1 blocker row d hxlow]
      apply Bool.eq_false_of_not_eq_true
      intro hxtrue
      have hkEq := (v14Assign_xVar_eq_true_iff
        (canonicalV14Coordinate cell.1) blocker
        (SafeCoverIndexBridge.coverIndex row)
        (fun _ hp => SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow hp)
        (blocker cell.2.blockerSourceIndex).isLt hkLt).1 hxtrue
      have hselectedBit := hkBit
      rw [hkEq,
        SafeCoverIndexBridge.coverIndex_testBit_of_safeCubeOK hrow
          (blocker cell.2.blockerSourceIndex)
          cell.2.deletionLabel] at hselectedBit
      exact hadded.2.2 (of_decide_eq_true hselectedBit)
    simp [namedDeletionBinaryClause, evalClauseD, hxfalse]
  · have hblockerFalse :
        nextRowAssign cell.1 blocker row d
            (blockerVar (blockerLayout cell)
              cell.2.blockerSourceIndex center) = false := by
      have hleSource := blockerVar_le_sourceBlocksEnd
        (blockerLayout cell) cell.2.blockerSourceIndex hcenter
      have hleFinal :
          blockerVar (blockerLayout cell) cell.2.blockerSourceIndex center ≤
            finalNumVars (canonicalV14Coordinate cell.1) := by
        rw [sourceBlocksEnd_eq] at hleSource
        rw [FrozenV14JobCnf.finalNumVars_eq]
        exact hleSource.trans (by omega)
      rw [nextRowAssign_low cell.1 blocker row d hleFinal]
      apply Bool.eq_false_of_not_eq_true
      intro htrue
      have heq := (v14Assign_blockerVar_eq_true_iff
        (canonicalV14Coordinate cell.1)
        (frozenPhysicalCycleCnfAddedConstraintsHold_of_nextRowOnlyHit hadded.1)
        (SafeCoverIndexBridge.coverIndex row) cell.2.blockerSourceIndex
        (by simpa [blockerLayout] using hcenter)).1 htrue
      exact hselected heq
    simp [namedDeletionBinaryClause, evalClauseD, hblockerFalse]

/-- Every clause emitted at one admissible blocker center is true. -/
theorem nextRowAssign_sat_namedDeletionCenterClauses
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenNextRowArmCell) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowFixedNamedDeletionArmAddedConstraintsHold
      row blocker (cell.1.1 : Label × Label).1
        (cell.1.1 : Label × Label).2 cell.2)
    (d : Label) {center : Nat}
    (hcenter : center ∈ blockerCenters
      ((physicalSources (blockerLayout cell)).getD
        cell.2.blockerSourceIndex.val 0)) :
    ∀ c ∈ namedDeletionCenterClauses cell center,
      evalClauseD (nextRowAssign cell.1 blocker row d) c = true := by
  intro c hc
  by_cases htwo : center = 2
  · subst center
    rw [namedDeletionCenterClauses, if_pos rfl, List.mem_append] at hc
    rcases hc with hc | hc
    · simp only [List.mem_cons, List.not_mem_nil, or_false] at hc
      subst c
      exact nextRowAssign_sat_namedDeletionCenterTwoUnit
        cell hrow hadded d
    · obtain ⟨k, hk, rfl⟩ := List.mem_map.mp hc
      exact nextRowAssign_sat_namedDeletionBinaryClause
        cell hrow hadded d hcenter hk
  · simp only [namedDeletionCenterClauses, if_neg htwo,
      List.nil_append] at hc
    obtain ⟨k, hk, rfl⟩ := List.mem_map.mp hc
    exact nextRowAssign_sat_namedDeletionBinaryClause
      cell hrow hadded d hcenter hk

/-- The canonical next-row assignment satisfies the exact fixed-arm suffix. -/
theorem nextRowAssign_sat_namedDeletionArmClauseDelta
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenNextRowArmCell) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowFixedNamedDeletionArmAddedConstraintsHold
      row blocker (cell.1.1 : Label × Label).1
        (cell.1.1 : Label × Label).2 cell.2)
    (d : Label) :
    ∀ c ∈ namedDeletionArmClauseDelta cell,
      evalClauseD (nextRowAssign cell.1 blocker row d) c = true := by
  intro c hc
  simp only [namedDeletionArmClauseDelta, List.mem_flatMap] at hc
  obtain ⟨center, hcenter, hc⟩ := hc
  exact nextRowAssign_sat_namedDeletionCenterClauses
    cell hrow hadded d hcenter c hc

end FrozenNextRowNamedDeletionJobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
