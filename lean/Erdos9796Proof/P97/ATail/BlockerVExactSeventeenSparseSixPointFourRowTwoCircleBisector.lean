/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCocircularPentagonOrderSparseSixPointFullBankPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFourPointTwoCircleBisectorRows

/-!
# Four-row two-circle refinement of the exact-seventeen sparse-six bank

The first structural model of the physical-multiplicity split contains a
four-row equality chain placing two boundary points on the same side of the
line through two circle centers.  This module banks the complete named-order
and reflection orbit, appends its four source-valid clauses to the cumulative
sparse-six root, and exposes the terminal finite-UNSAT landing contract.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open
  ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
  ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenConvexFivePointFourthRows
open ATailBlockerVExactSeventeenFourPointTwoCircleBisectorRows
open ATailBlockerVExactSeventeenCocircularPentagonOrderSparseSixPointFullBankPromotion
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- The four positional selected rows generating the forward two-circle core. -/
def forwardChoices : List (RowChoice Label) :=
  [{ center := 1, support := {4, 6} },
    { center := 8, support := {4, 7} },
    { center := 7, support := {8, 6} },
    { center := 6, support := {7, 8} }]

/-- Reflection of the four positional selected rows. -/
def reflectedChoices : List (RowChoice Label) :=
  [{ center := 15, support := {10, 12} },
    { center := 8, support := {9, 12} },
    { center := 9, support := {8, 10} },
    { center := 10, support := {8, 9} }]

/-- The eight positive incidences serialized into one guarded clause. -/
def baseHits : List Hit :=
  [(1, 4), (1, 6), (8, 4), (8, 7),
    (7, 8), (7, 6), (6, 7), (6, 8)]

/-- Transport the positional motif into one named source order and orientation. -/
def fourRowTwoCircleHits (order : NamedOrder) (direction : Orientation) :
    List Hit :=
  baseHits.map fun hit =>
    (orientedLabelAtPosition order direction hit.1,
      orientedLabelAtPosition order direction hit.2)

private theorem baseHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ forwardChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ baseHits := by
  decide +revert

private theorem reflectedBaseHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ reflectedChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ baseHits := by
  decide +revert

private theorem sourceIndexEquiv_symm_eq_of_same
    (order : NamedOrder) (actual direction : Orientation)
    (hsame : actual = direction) (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction index := by
  subst actual
  rfl

private theorem sourceIndexEquiv_symm_eq_reflected_of_ne
    (order : NamedOrder) (actual direction : Orientation)
    (hne : actual ≠ direction) (index : Label) :
    (sourceIndexEquiv order actual).symm index =
      orientedLabelAtPosition order direction (Fin.rev index) := by
  cases actual <;> cases direction <;>
    simp_all [sourceIndexEquiv, orientedLabelAtPosition]

private theorem positiveRowsMatch_forward {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
    (hall : ∀ hit ∈ fourRowTwoCircleHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      forwardChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  exact hall
    (orientedLabelAtPosition source.model.order direction choice.center,
      orientedLabelAtPosition source.model.order direction point)
    (by
      simp only [fourRowTwoCircleHits, List.mem_map]
      exact ⟨(choice.center, point),
        baseHit_of_choice choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_reflected {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (hall : ∀ hit ∈ fourRowTwoCircleHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      reflectedChoices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  exact hall
    (orientedLabelAtPosition source.model.order direction (Fin.rev choice.center),
      orientedLabelAtPosition source.model.order direction (Fin.rev point))
    (by
      simp only [fourRowTwoCircleHits, List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        reflectedBaseHit_of_choice choice hchoice point hpoint, rfl⟩)

private def forwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P forwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P :=
  { q := 1
    v := 8
    u := 4
    y := 6
    huy := by decide
    qu_qy := EdgeClosure.row 1 4 6
      (hrows ({ center := 1, support := {4, 6} } : RowChoice Label)
        (by decide) (by decide))
      (hrows ({ center := 1, support := {4, 6} } : RowChoice Label)
        (by decide) (by decide))
    uv_yv := EdgeClosure.trans (EdgeClosure.flip 4 8)
      (EdgeClosure.trans
        (EdgeClosure.row 8 4 7
        (hrows ({ center := 8, support := {4, 7} } : RowChoice Label)
          (by decide) (by decide))
        (hrows ({ center := 8, support := {4, 7} } : RowChoice Label)
          (by decide) (by decide)))
        (EdgeClosure.trans (EdgeClosure.flip 8 7)
          (EdgeClosure.trans
            (EdgeClosure.row 7 8 6
              (hrows ({ center := 7, support := {8, 6} } : RowChoice Label)
                (by decide) (by decide))
              (hrows ({ center := 7, support := {8, 6} } : RowChoice Label)
                (by decide) (by decide)))
            (EdgeClosure.trans (EdgeClosure.flip 7 6)
              (EdgeClosure.row 6 7 8
                (hrows ({ center := 6, support := {7, 8} } : RowChoice Label)
                  (by decide) (by decide))
                (hrows ({ center := 6, support := {7, 8} } : RowChoice Label)
                  (by decide) (by decide))))))) }

private def reflectedCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P reflectedChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P :=
  { q := 15
    v := 8
    u := 12
    y := 10
    huy := by decide
    qu_qy := EdgeClosure.row 15 12 10
      (hrows ({ center := 15, support := {10, 12} } : RowChoice Label)
        (by decide) (by decide))
      (hrows ({ center := 15, support := {10, 12} } : RowChoice Label)
        (by decide) (by decide))
    uv_yv := EdgeClosure.trans (EdgeClosure.flip 12 8)
      (EdgeClosure.trans
        (EdgeClosure.row 8 12 9
        (hrows ({ center := 8, support := {9, 12} } : RowChoice Label)
          (by decide) (by decide))
        (hrows ({ center := 8, support := {9, 12} } : RowChoice Label)
          (by decide) (by decide)))
        (EdgeClosure.trans (EdgeClosure.flip 8 9)
          (EdgeClosure.trans
            (EdgeClosure.row 9 8 10
              (hrows ({ center := 9, support := {8, 10} } : RowChoice Label)
                (by decide) (by decide))
              (hrows ({ center := 9, support := {8, 10} } : RowChoice Label)
                (by decide) (by decide)))
            (EdgeClosure.trans (EdgeClosure.flip 9 10)
              (EdgeClosure.row 10 9 8
                (hrows ({ center := 10, support := {8, 9} } : RowChoice Label)
                  (by decide) (by decide))
                (hrows ({ center := 10, support := {8, 9} } : RowChoice Label)
                  (by decide) (by decide))))))) }

private theorem signedArea2_cycle (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 c a b := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap12 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 b a c := by
  simp only [signedArea2]
  ring

private theorem false_of_forwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P forwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core
    hreal (forwardCore hrows)
  · change 0 < signedArea2 (pointOf 4) (pointOf 1) (pointOf 8)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (4 : Label)) (k := (8 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 6) (pointOf 1) (pointOf 8)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (6 : Label)) (k := (8 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_reflectedRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P reflectedChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg
    hreal (reflectedCore hrows)
  · change signedArea2 (pointOf 12) (pointOf 15) (pointOf 8) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (8 : Label)) (j := (12 : Label)) (k := (15 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 10) (pointOf 15) (pointOf 8) < 0
    rw [signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (8 : Label)) (j := (10 : Label)) (k := (15 : Label))
      (by decide) (by decide)

private theorem false_of_fourRowTwoCircleHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ fourRowTwoCircleHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_forwardRows hreal source.boundary_ccw
      (positiveRowsMatch_forward source source.model.order direction rfl hsame hall)
  · exact false_of_reflectedRows hreal source.boundary_ccw
      (positiveRowsMatch_reflected source source.model.order direction rfl hsame hall)

/-- One guarded four-row two-circle clause. -/
def fourRowTwoCircleClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom :=
  nogoodClause order (fourRowTwoCircleHits order direction)

theorem sourceAssign_fourRowTwoCircleClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (fourRowTwoCircleClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_fourRowTwoCircleHits source order direction horder.symm hall

/-- Complete orbit over both named source orders and cyclic orientations. -/
def fourRowTwoCircleClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => fourRowTwoCircleClause order direction

theorem fourRowTwoCircleClauses_length : fourRowTwoCircleClauses.length = 4 := by
  decide

theorem sourceAssign_fourRowTwoCircleClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ fourRowTwoCircleClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fourRowTwoCircleClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_fourRowTwoCircleClause source order direction

/-- Lean-owned successor of the cumulative sparse-six exact-seventeen root. -/
def extendedCocircularOrderSparseSixPointFourRowBisectorCnf : Std.Sat.CNF Atom :=
  extendedCocircularOrderSparseSixPointFullBankCnf ++ fourRowTwoCircleClauses

theorem extendedCocircularOrderSparseSixPointFourRowBisectorCnf_length :
    extendedCocircularOrderSparseSixPointFourRowBisectorCnf.length = 7409257 := by
  simp [extendedCocircularOrderSparseSixPointFourRowBisectorCnf,
    extendedCocircularOrderSparseSixPointFullBankCnf_length,
    fourRowTwoCircleClauses_length]

/-- The order-zero forward occurrence has the exact labels found in the
physical-slice survivor. -/
theorem orderZero_forward_hits :
    fourRowTwoCircleHits 0 .forward =
      [(6, 10), (6, 12), (2, 10), (2, 7),
        (7, 2), (7, 12), (12, 7), (12, 2)] := by
  decide

/-- The motivating guarded clause has the canonical exact DIMACS literals. -/
theorem orderZero_forward_clause_dimacs :
    (fourRowTwoCircleClause 0 .forward).map litToDimacs =
      [-307, -113, -115, -45, -42, -122, -132, -212, -207] := by
  decide

theorem sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorCnf
    {A : Finset ℝ²} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedCocircularOrderSparseSixPointFourRowBisectorCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedCocircularOrderSparseSixPointFourRowBisectorCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_extendedCocircularOrderSparseSixPointFullBankCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_fourRowTwoCircleClauses source clause hsuffix

/-- Certificate-to-source landing contract for the four-row bisector child. -/
theorem false_of_sourceRealization_of_extendedCocircularOrderSparseSixPointFourRowBisectorCnf_unsat
    {A : Finset ℝ²}
    (hsource : ∃ source : SourceRealization A, source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment
        extendedCocircularOrderSparseSixPointFourRowBisectorCnf = true) :
    False := by
  rcases hsource with ⟨source, horder⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorCnf
      source horder⟩

#print axioms sourceAssign_fourRowTwoCircleClause
#print axioms orderZero_forward_clause_dimacs
#print axioms
  sourceAssign_extendedCocircularOrderSparseSixPointFourRowBisectorCnf
#print axioms
  false_of_sourceRealization_of_extendedCocircularOrderSparseSixPointFourRowBisectorCnf_unsat

end ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector
end Problem97
