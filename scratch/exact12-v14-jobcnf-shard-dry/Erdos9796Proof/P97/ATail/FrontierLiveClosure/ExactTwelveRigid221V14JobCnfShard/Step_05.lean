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
