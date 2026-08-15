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
