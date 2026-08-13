/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14SourceJobBridge
import Erdos9796Proof.P97.Census554.SinzSat
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step_06

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

/-- Every clause emitted at one admissible named-deletion blocker center is
true under the canonical source assignment. -/
theorem v14Assign_sat_namedDeletionCenterClauses
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1)
    {center : Nat}
    (hcenter : center ∈ blockerCenters ((physicalSources cell).getD
      cell.2.1.blockerSourceIndex.val 0)) :
    ∀ c ∈ namedDeletionCenterClauses cell center,
      evalClauseD
        (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c =
          true := by
  intro c hc
  by_cases htwo : center = 2
  · subst center
    rw [namedDeletionCenterClauses, if_pos rfl, List.mem_append] at hc
    rcases hc with hc | hc
    · simp only [List.mem_cons, List.not_mem_nil, or_false] at hc
      subst c
      exact v14Assign_sat_namedDeletionCenterTwoUnit cell hrow hadded
    · obtain ⟨k, hk, rfl⟩ := List.mem_map.mp hc
      exact v14Assign_sat_namedDeletionBinaryClause cell hrow hadded hcenter hk
  · simp only [namedDeletionCenterClauses, if_neg htwo, List.nil_append] at hc
    obtain ⟨k, hk, rfl⟩ := List.mem_map.mp hc
    exact v14Assign_sat_namedDeletionBinaryClause cell hrow hadded hcenter hk

/-- The canonical source assignment satisfies every exact clause emitted for
the selected named-deletion arm. -/
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

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
