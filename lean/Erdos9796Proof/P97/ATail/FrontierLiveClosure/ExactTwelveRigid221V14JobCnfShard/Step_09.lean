/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14SourceJobBridge
import Erdos9796Proof.P97.Census554.SinzSat
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step_08

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
theorem v14Assign_sat_allCenterSinzClauses
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2) :
    ∀ c ∈ allCenterSinzClauses cell,
      evalClauseD
        (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c = true := by
  intro c hc
  obtain ⟨center, hcenter, hc⟩ := List.mem_flatMap.mp hc
  exact centerSinzAssign_sat_center cell hadded
    (SafeCoverCnf.finalAssign (SafeCoverIndexBridge.coverIndex row))
    (List.mem_range.mp hcenter) hc

/-- The canonical assignment satisfies the complete clause prefix shared by
every physical-cycle job with this placement. -/
theorem v14Assign_sat_commonPhysicalCycleClauseDelta
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    {c : List Int} (hc : c ∈ commonPhysicalCycleClauseDelta cell) :
    evalClauseD
      (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c = true := by
  rcases List.mem_append.mp hc with hc | hc
  · exact v14Assign_sat_initialClauses cell hrow hadded c hc
  · rcases List.mem_append.mp hc with hc | hc
    · exact v14Assign_sat_allSourceBlockClauses cell hrow hadded c hc
    · rcases List.mem_append.mp hc with hc | hc
      · exact v14Assign_sat_forcedBlockerClauses cell hadded
          (SafeCoverIndexBridge.coverIndex row) c hc
      · exact v14Assign_sat_allCenterSinzClauses cell hadded c hc

/-- The canonical source/blocker/Sinz assignment satisfies every clause in
the complete ordered Lean reconstruction of the normalized-v14 job delta. -/
theorem v14Assign_sat_reconstructedClauseDelta
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenV14AddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2
      cell.2.1 cell.2.2.1) :
    ∀ c ∈ reconstructedClauseDelta cell,
      evalClauseD
      (v14Assign cell blocker (SafeCoverIndexBridge.coverIndex row)) c = true := by
  have hprefix := frozenPhysicalCycleCnfAddedConstraintsHold_of_v14 hadded
  intro c hc
  rcases List.mem_append.mp hc with hc | hc
  · exact v14Assign_sat_initialClauses cell hrow hprefix c hc
  · rcases List.mem_append.mp hc with hc | hc
    · exact v14Assign_sat_allSourceBlockClauses cell hrow hprefix c hc
    · rcases List.mem_append.mp hc with hc | hc
      · exact v14Assign_sat_forcedBlockerClauses cell hprefix
          (SafeCoverIndexBridge.coverIndex row) c hc
      · rcases List.mem_append.mp hc with hc | hc
        · exact v14Assign_sat_allCenterSinzClauses cell hprefix c hc
        · rcases List.mem_append.mp hc with hc | hc
          · exact v14Assign_sat_namedDeletionArmClauses cell hrow hadded c hc
          · exact v14Assign_sat_distinguishedDClauses cell hrow hadded c hc

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
