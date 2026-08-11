/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticRelationLayout

/-!
# Source valuation for the exact-twelve frozen static parent

This file extends the already-proved source assignment for the reconstructed
next-row formula with the geometric equality valuation of the 2,145 fresh
relation variables.  It also proves the selected-candidate reflection needed
by the row-implication clause family.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticRelationAssignment

open Census554.CoverCnf
open Census554.EqualityCore
open FrozenNextRowCompiledJob
open FrozenNextRowJobCnf
open SafeCoverIndexBridge
open StaticRelationLayout
open StaticRelationSemantics
open TerminalBankConsumer
open scoped EuclideanGeometry

abbrev Label := ExactTwelveCarrierIngress.Label

/-- Preserve the complete source-faithful next-row assignment and use actual
metric equality only on the fresh static tail. -/
noncomputable def staticAssign
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label)
    (row : RowPattern Label) (d : Label) (pointOf : Label → ℝ²) : Nat → Bool :=
  fun v =>
    if v ≤ nextRowFinalNumVars cell then nextRowAssign cell blocker row d v
    else relationAssign pointOf v

theorem staticAssign_eq_nextRowAssign_of_le
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label)
    (row : RowPattern Label) (d : Label) (pointOf : Label → ℝ²)
    {v : Nat} (hv : v ≤ nextRowFinalNumVars cell) :
    staticAssign cell blocker row d pointOf v =
      nextRowAssign cell blocker row d v := by
  simp [staticAssign, hv]

set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
/-- Every positive relation variable lies strictly after the frozen next-row
prefix and within the final 44,875-variable parent interval. -/
theorem relationVar_bounds :
    ∀ e f : Edge Label, 0 < relationVar e f →
      42730 < relationVar e f ∧ relationVar e f ≤ 44875 := by
  native_decide

theorem staticAssign_eq_relationAssign
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label)
    (row : RowPattern Label) (d : Label) (pointOf : Label → ℝ²)
    (e f : Edge Label) (hpositive : 0 < relationVar e f) :
    staticAssign cell blocker row d pointOf (relationVar e f) =
      relationAssign pointOf (relationVar e f) := by
  have hcutoff : nextRowFinalNumVars cell < relationVar e f := by
    rw [nextRowFinalNumVars_eq]
    exact (relationVar_bounds e f hpositive).1
  simp [staticAssign, Nat.not_le.mpr hcutoff]

/-- The combined source/static assignment retains the exact metric-equality
semantics of every fresh relation variable. -/
theorem staticAssign_encodesMetricEquality
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label)
    (row : RowPattern Label) (d : Label) (pointOf : Label → ℝ²) :
    EncodesMetricEquality
      (staticAssign cell blocker row d pointOf) relationVar pointOf := by
  intro e f hpositive
  rw [staticAssign_eq_relationAssign cell blocker row d pointOf e f hpositive]
  exact relationAssign_encodesMetricEquality pointOf e f hpositive

/-- Every literal in the reconstructed next-row formula is in the preserved
prefix interval. -/
theorem reconstructedCompleteDimacs_lit_bound (cell : FrozenNextRowCell) :
    ∀ c ∈ reconstructedCompleteDimacs cell, ∀ l ∈ c,
      l.natAbs ≤ nextRowFinalNumVars cell := by
  intro c hc l hl
  rcases List.mem_append.mp hc with hbase | hdelta
  · have hbound := baseDimacs_lit_bound c hbase l hl
    rw [nextRowFinalNumVars_eq]
    exact hbound.trans (by rw [SafeCoverCnf.baseNumVars_eq]; omega)
  · exact reconstructedClauseDelta_lit_bound cell c hdelta l hl

/-- Replacing only the fresh static tail preserves satisfaction of the whole
source-faithful reconstructed next-row prefix. -/
theorem staticAssign_sat_reconstructedCompleteDimacs
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenNextRowCell) (hrow : FrozenSafeCubeOK row)
    (hadded : FrozenNextRowOnlyHitAddedConstraintsHold row blocker
      (cell.1 : Label × Label).1 (cell.1 : Label × Label).2)
    (pointOf : Label → ℝ²) :
    ∃ d : Label, ∀ c ∈ reconstructedCompleteDimacs cell,
      evalClauseD (staticAssign cell blocker row d pointOf) c = true := by
  obtain ⟨d, _hbase, hprefix⟩ :=
    exists_nextRowAssign_sat_reconstructedCompleteDimacs cell hrow hadded
  refine ⟨d, ?_⟩
  intro c hc
  calc
    evalClauseD (staticAssign cell blocker row d pointOf) c =
        evalClauseD (nextRowAssign cell blocker row d) c := by
      apply SafeCoverCnf.evalClauseD_congr
      intro l hl
      exact staticAssign_eq_nextRowAssign_of_le cell blocker row d pointOf
        (reconstructedCompleteDimacs_lit_bound cell c hc l hl)
    _ = true := hprefix c hc

/-- If a valid compiler candidate variable is selected by the combined
assignment, every set bit in that candidate mask is a genuine member of the
source row. -/
theorem mem_row_of_selected_candidate_bit
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (cell : FrozenNextRowCell) (blocker : Fin 5 → Label)
    (d : Label) (pointOf : Label → ℝ²)
    (center a : Label) (candidateIndex : Nat)
    (hindex : candidateIndex < SafeCoverCnf.candCount center.val)
    (hbit : ((SafeCoverCnf.candMasks center.val).getD candidateIndex 0).testBit
      a.val = true)
    (hselected : staticAssign cell blocker row d pointOf
      (SafeCoverCnf.xVar center.val candidateIndex) = true) :
    a ∈ row center := by
  have hxbase : SafeCoverCnf.xVar center.val candidateIndex ≤
      SafeCoverCnf.baseNumVars := by
    exact (SafeCoverCnf.xVar_le_nX center.isLt hindex).trans (by
      rw [SafeCoverCnf.nX_eq, SafeCoverCnf.baseNumVars_eq]
      omega)
  have hxcutoff : SafeCoverCnf.xVar center.val candidateIndex ≤
      nextRowFinalNumVars cell := by
    rw [nextRowFinalNumVars_eq]
    exact hxbase.trans (by rw [SafeCoverCnf.baseNumVars_eq]; omega)
  have hnext : nextRowAssign cell blocker row d
      (SafeCoverCnf.xVar center.val candidateIndex) = true := by
    rw [← staticAssign_eq_nextRowAssign_of_le
      cell blocker row d pointOf hxcutoff]
    exact hselected
  have hfinal : SafeCoverCnf.finalAssign (coverIndex row)
      (SafeCoverCnf.xVar center.val candidateIndex) = true := by
    rw [← FrozenNextRowCompiledJob.nextRowAssign_agreesOnBase
      cell blocker row d _ hxbase]
    exact hnext
  have hsourceIndex : ∀ p, p < 12 →
      coverIndex row p < SafeCoverCnf.candCount p := by
    intro p hp
    exact coverIndex_lt_of_safeCubeOK hrow hp
  have hbase : SafeCoverCnf.baseAssign (coverIndex row)
      (SafeCoverCnf.xVar center.val candidateIndex) = true := by
    rw [← SafeCoverCnf.finalAssign_x (coverIndex row) center.isLt hindex]
    exact hfinal
  have hindexEq : candidateIndex = coverIndex row center.val :=
    (SafeCoverCnf.baseAssign_iff (coverIndex row) hsourceIndex center.isLt
      hindex).mp hbase
  have hrowBit := coverIndex_testBit_of_safeCubeOK hrow center a
  rw [← hindexEq] at hrowBit
  exact of_decide_eq_true (hrowBit.symm.trans hbit)

end StaticRelationAssignment
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
