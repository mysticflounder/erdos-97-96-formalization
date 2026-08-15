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

/- ## Ordinary added-clause reflection -/

/-- On a valid candidate variable, the complete v14 extension is true exactly
when that candidate is the row selected by the source-faithful cover index. -/
theorem v14Assign_xVar_eq_true_iff
    (cell : FrozenV14JobCoordinate) (blocker : Fin 5 → Label)
    (idx : Nat → Nat)
    (hidx : ∀ p, p < 12 → idx p < SafeCoverCnf.candCount p)
    {p i : Nat} (hp : p < 12) (hi : i < SafeCoverCnf.candCount p) :
    v14Assign cell blocker idx (SafeCoverCnf.xVar p i) = true ↔
      i = idx p := by
  have hx : SafeCoverCnf.xVar p i ≤ SafeCoverCnf.baseNumVars := by
    calc
      SafeCoverCnf.xVar p i ≤ SafeCoverCnf.nX :=
        SafeCoverCnf.xVar_le_nX hp hi
      _ ≤ SafeCoverCnf.baseNumVars := by
        rw [SafeCoverCnf.nX_eq, SafeCoverCnf.baseNumVars_eq]
        omega
  rw [v14Assign_base_low cell blocker idx hx,
    SafeCoverCnf.finalAssign_x idx hp hi,
    SafeCoverCnf.baseAssign_iff idx hidx hp hi]

/-- Candidate indices satisfying a numerical row predicate, in the exact
table order used by Python's `enumerate(instance.candidates[center])`. -/
def candidateIndicesMatching (p : Nat) (ok : Nat → Bool) : List Nat :=
  (List.range (SafeCoverCnf.candCount p)).filter fun i =>
    ok ((SafeCoverCnf.candMasks p).getD i 0)

/-- Candidate variables satisfying a numerical row predicate, preserving the
ordered matching-index list. -/
def varsMatching (p : Nat) (ok : Nat → Bool) : List Nat :=
  (candidateIndicesMatching p ok).map fun i => SafeCoverCnf.xVar p i

/-- A valid candidate whose mask passes the predicate occurs in the ordered
matching-variable list. -/
theorem xVar_mem_varsMatching {p i : Nat} {ok : Nat → Bool}
    (hi : i < SafeCoverCnf.candCount p)
    (hok : ok ((SafeCoverCnf.candMasks p).getD i 0) = true) :
    SafeCoverCnf.xVar p i ∈ varsMatching p ok := by
  apply List.mem_map.mpr
  refine ⟨i, ?_, rfl⟩
  exact List.mem_filter.mpr ⟨List.mem_range.mpr hi, hok⟩

/-- The first compiler clause: the exact normalized row at center `1`. -/
def centerOneExactRowClause (cell : FrozenV14JobCoordinate) : List Int :=
  [Int.ofNat (SafeCoverCnf.xVar 1
    (SafeCoverIndexBridge.coverIndexAt (1 : Label)
      (frozenRowAtOne
        (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)))]

/-- The source-selected row at center `1` satisfies the compiler's exact-row
unit clause. -/
theorem v14Assign_sat_centerOneExactRowClause
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2) :
    evalClauseD
      (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row))
      (centerOneExactRowClause cell) = true := by
  let jd : Label := (cell.1.1 : Label × Label).1
  let v : Label := (cell.1.1 : Label × Label).2
  have hK : FrozenSafeCandidateAt (1 : Label) (frozenRowAtOne jd v) := by
    have hcandidate := (mem_frozenSafeCandidateClasses).1
      (hrow.candidate_mem (1 : Label))
    rw [hadded.1] at hcandidate
    exact hcandidate
  have hi : SafeCoverIndexBridge.coverIndexAt (1 : Label)
      (frozenRowAtOne jd v) < SafeCoverCnf.candCount 1 :=
    SafeCoverIndexBridge.coverIndexAt_lt _ _ hK
  have hidx : SafeCoverIndexBridge.coverIndex row 1 =
      SafeCoverIndexBridge.coverIndexAt (1 : Label)
        (frozenRowAtOne jd v) := by
    dsimp [jd, v]
    simp [SafeCoverIndexBridge.coverIndex, hadded.1]
  simp only [centerOneExactRowClause, evalClauseD, List.any_cons,
    List.any_nil, Bool.or_false]
  rw [evalLitD_pos]
  · rw [v14Assign_xVar_eq_true_iff cell blocker
      (SafeCoverIndexBridge.coverIndex row)
      (fun _ hp => SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow hp)
      (by decide) hi]
    exact hidx.symm
  · exact SafeCoverCnf.one_le_xVar _ _

/-- The second compiler clause: some center-`7` row has physical
intersection exactly `{6,8}`.  `varsMatching` preserves the compiler's
candidate-literal order. -/
def centerSevenPhysicalIntersectionClause
    (cell : FrozenV14JobCoordinate) : List Int :=
  let physical := frozenPhysicalLabels
    (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
  (varsMatching 7 fun m =>
    (m &&& SafeCoverIndexBridge.classMask physical) ==
      SafeCoverIndexBridge.classMask ({6, 8} : Finset Label)).map Int.ofNat

/-- The source-selected row at center `7` satisfies the compiler's positive
physical-intersection clause. -/
theorem v14Assign_sat_centerSevenPhysicalIntersectionClause
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2) :
    evalClauseD
      (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row))
      (centerSevenPhysicalIntersectionClause cell) = true := by
  let physical := frozenPhysicalLabels
    (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
  let selected := SafeCoverIndexBridge.coverIndex row 7
  have hi : selected < SafeCoverCnf.candCount 7 :=
    SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow (by decide)
  have hmask : (SafeCoverCnf.candMasks 7).getD selected 0 =
      SafeCoverIndexBridge.classMask (row (7 : Label)) :=
    SafeCoverIndexBridge.getD_coverIndex_of_safeCubeOK hrow (7 : Label)
  have hphysical :
      (SafeCoverCnf.candMasks 7).getD selected 0 &&&
          SafeCoverIndexBridge.classMask physical =
        SafeCoverIndexBridge.classMask ({6, 8} : Finset Label) := by
    rw [hmask, SafeCoverIndexBridge.classMask_land_classMask]
    exact congrArg SafeCoverIndexBridge.classMask hadded.2.1
  have hnat : SafeCoverCnf.xVar 7 selected ∈
      varsMatching 7 (fun m =>
        (m &&& SafeCoverIndexBridge.classMask physical) ==
          SafeCoverIndexBridge.classMask ({6, 8} : Finset Label)) := by
    apply xVar_mem_varsMatching hi
    simpa [hphysical]
  have hmem : Int.ofNat (SafeCoverCnf.xVar 7 selected) ∈
      centerSevenPhysicalIntersectionClause cell := by
    apply List.mem_map.mpr
    exact ⟨SafeCoverCnf.xVar 7 selected, hnat, rfl⟩
  simp only [evalClauseD, List.any_eq_true]
  refine ⟨Int.ofNat (SafeCoverCnf.xVar 7 selected), hmem, ?_⟩
  rw [evalLitD_pos]
  · exact (v14Assign_xVar_eq_true_iff cell blocker
      (SafeCoverIndexBridge.coverIndex row)
      (fun _ hp => SafeCoverIndexBridge.coverIndex_lt_of_safeCubeOK hrow hp)
      (by decide) hi).2 rfl
  · exact SafeCoverCnf.one_le_xVar _ _

/-- The complete v14 extension is true at a blocker input exactly when that
center is the semantic blocker selected for its physical source. -/
theorem v14Assign_blockerVar_eq_true_iff
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (idx : Nat → Nat) (i : Fin 5) {center : Nat}
    (hcenter : center ∈
      blockerCenters ((physicalSources cell).getD i.val 0)) :
    v14Assign cell blocker idx (blockerVar cell i center) = true ↔
      center = (blocker i).val := by
  have hmem : blockerVar cell i center ∈ sourceBlockerVars cell i :=
    List.mem_map.mpr ⟨center, hcenter, rfl⟩
  rw [v14Assign,
    centerSinzAssign_low cell _ (blockerVar_le_sourceBlocksEnd cell i hcenter),
    sourceSinzAssign_sourceBlockerVar cell _ i hmem]
  exact blockerAssign_blockerVar_eq_true_iff cell hadded _ i hcenter

/-- The blocker variable selected by a semantic blocker function is true in
the complete v14 extension. -/
theorem v14Assign_selectedBlockerVar_eq_true
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (idx : Nat → Nat) (i : Fin 5) :
    v14Assign cell blocker idx
      (blockerVar cell i (blocker i).val) = true := by
  have hcenter := blocker_mem_blockerCenters_of_addedConstraints cell hadded i
  exact (v14Assign_blockerVar_eq_true_iff cell hadded idx i hcenter).2 rfl

/-- Candidate variables admitted by one physical-source/blocker implication,
in the compiler's exact candidate-table order. -/
def sourceAllowedVars (cell : FrozenV14JobCoordinate) (i : Fin 5)
    (center : Nat) : List Nat :=
  varsMatching center fun m =>
    m.testBit ((physicalSources cell).getD i.val 0) &&
      ((m &&& SafeCoverIndexBridge.classMask
          (frozenPhysicalLabels
            (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)) ==
        SafeCoverIndexBridge.classMask
          (frozenPhysicalEdges
            (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2 i))

/-- One compiler implication from a possible blocker center to an admissible
selected row at that center. -/
def sourceImplicationClause (cell : FrozenV14JobCoordinate) (i : Fin 5)
    (center : Nat) : List Int :=
  -Int.ofNat (blockerVar cell i center) ::
    (sourceAllowedVars cell i center).map Int.ofNat

/-- The ten source implications, in the increasing-center order emitted by
the Python compiler. -/
def sourceImplicationClauses (cell : FrozenV14JobCoordinate) (i : Fin 5) :
    List (List Int) :=
  (blockerCenters ((physicalSources cell).getD i.val 0)).map
    (sourceImplicationClause cell i)

/-- The source-faithful blocker and selected row satisfy one emitted physical
cycle implication. -/
