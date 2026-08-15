/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFourthModelRefinements

/-!
# Child45 next-center coverage adapter

This module is the small Lean-facing seam for the thirteen Child45
next-center cells.  It deliberately contains no solver or certificate claim:
it only identifies the singleton DIMACS assumptions with the source model and
provides the finite aggregation needed by a later checked cell coordinator.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenChild45NextCenterCoverage

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortyFourthModelRefinements

/-- The singleton assumption attached to one legal next-center cell. -/
def nextCenterUnitCnf (center : Label) : Std.Sat.CNF Atom :=
  [[pos (.nextCenter center)]]

/-- The authenticated Child45 root with one next-center cell assumption. -/
def nextCenterCellCnf (center : Label) : Std.Sat.CNF Atom :=
  extendedFortyFourthModelRefinementsCnf ++ nextCenterUnitCnf center

/-- The source-level positive literal has the campaign's `290 + center` ID. -/
theorem litToDimacs_pos_nextCenter (center : Label) :
    litToDimacs (pos (.nextCenter center)) =
      Int.ofNat (290 + center.val) := by
  simp [pos, litToDimacs, atomVar, nextCenterVar]

/-- A source model satisfying the cell's center equality satisfies its unit. -/
theorem sourceAssign_nextCenterUnit
    (model : SourceModel) {center : Label}
    (hcenter : model.nextCenter = center) :
    Std.Sat.CNF.eval (sourceAssign model) (nextCenterUnitCnf center) = true := by
  simp [nextCenterUnitCnf, Std.Sat.CNF.eval, Std.Sat.CNF.Clause.eval,
    sourceAssign, pos, hcenter]

/-- A source realization satisfies the Child45 root plus its matching unit. -/
theorem sourceAssign_nextCenterCell
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (source : SourceRealization A) {center : Label}
    (hcenter : source.model.nextCenter = center) :
    Std.Sat.CNF.eval (sourceAssign source.model) (nextCenterCellCnf center) = true := by
  rw [nextCenterCellCnf, Std.Sat.CNF.eval_append]
  rw [sourceAssign_extendedFortyFourthModelRefinementsCnf source]
  simp [sourceAssign_nextCenterUnit source.model hcenter]

/-- Every source model lies in one of the thirteen legal cells. -/
theorem sourceModel_mem_nextCenterCells (model : SourceModel) :
    model.nextCenter ∈ legalNextCenterLabels :=
  SourceModel.nextCenter_mem_legalNextCenterLabels model

/--
If every legal cell is independently contradictory, then no source model can
exist.  The cell contradiction is intentionally abstract over its proof
producer; a future coordinator can instantiate it with checked LRAT results or
source-valid refinements.
-/
theorem false_of_all_nextCenterCells
    (hcell : ∀ center, center ∈ legalNextCenterLabels →
      ¬ ∃ assignment,
        Std.Sat.CNF.eval assignment (nextCenterCellCnf center) = true)
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (hsource : Nonempty (SourceRealization A)) :
    False := by
  rcases hsource with ⟨source⟩
  have hmem : source.model.nextCenter ∈ legalNextCenterLabels :=
    sourceModel_mem_nextCenterCells source.model
  exact hcell source.model.nextCenter hmem ⟨sourceAssign source.model,
    sourceAssign_nextCenterCell source rfl⟩

#print axioms litToDimacs_pos_nextCenter
#print axioms sourceAssign_nextCenterUnit
#print axioms sourceAssign_nextCenterCell
#print axioms false_of_all_nextCenterCells

end ATailBlockerVExactSeventeenChild45NextCenterCoverage
end Problem97
