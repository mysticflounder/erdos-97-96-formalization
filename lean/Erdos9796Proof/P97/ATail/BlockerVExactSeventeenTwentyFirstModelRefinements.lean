/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenTwentiethModelRefinements

/-!
# Source-backed refinements from the twenty-first exact-seventeen SAT model

The authenticated model has five theorem-bank hits, but only two distinct
positive-hit supports.  The common bisector support also supplies the reported
two-Kalmanson cancellation and the three-point perpendicular-bisector motif,
so separate clauses for those two reports would duplicate the bisector cut.

This file therefore banks the two nonredundant occurrence families: one
four-point two-circle bisector family and one convex-five family.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenTwentyFirstModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenConvexFivePointFifthRows
open ATailBlockerVExactSeventeenTwentiethModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

private abbrev priorOrientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

private abbrev priorOccurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev priorOccurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

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

private theorem positiveRowsMatch_of_same {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
    (baseHits : List Hit) (choices : List (RowChoice Label))
    (hcover : ∀ choice ∈ choices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ baseHits)
    (hall : ∀ hit ∈ priorOrientedHits baseHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) choices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  exact hall
    (orientedLabelAtPosition source.model.order direction choice.center,
      orientedLabelAtPosition source.model.order direction point)
    (by
      simp only [priorOrientedHits,
        ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits,
        List.mem_map]
      exact ⟨(choice.center, point), hcover choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_of_ne {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (baseHits : List Hit) (choices : List (RowChoice Label))
    (hcover : ∀ choice ∈ choices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ baseHits)
    (hall : ∀ hit ∈ priorOrientedHits baseHits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected) choices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  exact hall
    (orientedLabelAtPosition source.model.order direction (Fin.rev choice.center),
      orientedLabelAtPosition source.model.order direction (Fin.rev point))
    (by
      simp only [priorOrientedHits,
        ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits,
        List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        hcover choice hchoice point hpoint, rfl⟩)

private theorem signedArea2_swap12 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 b a c := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 c b a := by
  simp only [signedArea2]
  ring

private theorem signedArea2_cycle (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 b c a := by
  simp only [signedArea2]
  ring

/- ## Common positive-hit bisector family -/

def bisectorForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {2, 13} },
    { center := 13, support := {3, 15} },
    { center := 15, support := {2, 13} },
    { center := 16, support := {3, 15} }]

def bisectorReverseChoices : List (RowChoice Label) :=
  [{ center := 13, support := {3, 14} },
    { center := 3, support := {1, 13} },
    { center := 1, support := {3, 14} },
    { center := 0, support := {1, 13} }]

def bisectorHits : List Hit :=
  [(3, 2), (3, 13), (13, 3), (13, 15),
    (15, 13), (15, 2), (16, 3), (16, 15)]

theorem bisectorForwardCover :
    ∀ choice ∈ bisectorForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ bisectorHits := by
  native_decide

theorem bisectorReverseCover :
    ∀ choice ∈ bisectorReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ bisectorHits := by
  native_decide

private def bisectorForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 2
  v := 16
  u := 3
  y := 15
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(2, 3), [.flip 2 3, .row 3 2 13, .flip 3 13,
      .row 13 3 15, .flip 13 15, .row 15 13 2, .flip 15 2],
      (2, 15)⟩ (by native_decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(3, 16), [.flip 3 16, .row 16 3 15, .flip 16 15],
      (15, 16)⟩ (by native_decide) }

private def bisectorReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P bisectorReverseChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {
  q := 14
  v := 0
  u := 1
  y := 13
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨(14, 1), [.flip 14 1, .row 1 14 3, .flip 1 3,
      .row 3 1 13, .flip 3 13, .row 13 3 14, .flip 13 14],
      (14, 13)⟩ (by native_decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨(1, 0), [.flip 1 0, .row 0 1 13, .flip 0 13],
      (13, 0)⟩ (by native_decide) }

private theorem false_of_bisectorForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (bisectorForwardCore hrows)
  · change 0 < signedArea2 (pointOf 3) (pointOf 2) (pointOf 16)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (3 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 15) (pointOf 2) (pointOf 16)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (15 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_bisectorReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P bisectorReverseChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (bisectorReverseCore hrows)
  · change signedArea2 (pointOf 1) (pointOf 14) (pointOf 0) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (14 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 13) (pointOf 14) (pointOf 0) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (13 : Label)) (k := (14 : Label))
      (by decide) (by decide)

private theorem false_of_bisectorHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits bisectorHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_bisectorForwardRows hreal source.boundary_ccw
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        bisectorHits bisectorForwardChoices bisectorForwardCover hall)
  · exact false_of_bisectorReverseRows hreal source.boundary_ccw
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        bisectorHits bisectorReverseChoices bisectorReverseCover hall)

theorem sourceAssign_bisectorClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause bisectorHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_bisectorHits source order direction horder.symm hall

/- ## Convex-five occurrence -/

def convexFiveForwardChoices : List (RowChoice Label) :=
  [{ center := 9, support := {2, 5} },
    { center := 4, support := {2, 5} },
    { center := 3, support := {2, 4, 9} }]

def convexFiveReverseChoices : List (RowChoice Label) :=
  [{ center := 7, support := {11, 14} },
    { center := 12, support := {11, 14} },
    { center := 13, support := {7, 12, 14} }]

def convexFiveHits : List Hit :=
  [(9, 5), (9, 2), (4, 5), (4, 2), (3, 2), (3, 9), (3, 4)]

theorem convexFiveForwardCover :
    ∀ choice ∈ convexFiveForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ convexFiveHits := by
  native_decide

theorem convexFiveReverseCover :
    ∀ choice ∈ convexFiveReverseChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ convexFiveHits := by
  native_decide

private def convexFiveForwardCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexFiveForwardChoices) :
    Census554.ConvexFivePointCore.Core P := {
  a := 5
  x := 9
  b := 2
  c := 3
  y := 4
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 9 5 2
    (hrows ({ center := 9, support := {2, 5} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 9, support := {2, 5} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 4 5 2
    (hrows ({ center := 4, support := {2, 5} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 4, support := {2, 5} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := EdgeClosure.row 3 2 9
    (hrows ({ center := 3, support := {2, 4, 9} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 3, support := {2, 4, 9} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cy := EdgeClosure.row 3 2 4
    (hrows ({ center := 3, support := {2, 4, 9} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 3, support := {2, 4, 9} } : RowChoice Label)
      (by native_decide) (by native_decide)) }

private def convexFiveReverseCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) :
    Census554.ConvexFivePointCore.Core P := {
  a := 11
  x := 7
  b := 14
  c := 13
  y := 12
  hab := by decide
  hxy := by decide
  xa_xb := EdgeClosure.row 7 11 14
    (hrows ({ center := 7, support := {11, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 7, support := {11, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
  ya_yb := EdgeClosure.row 12 11 14
    (hrows ({ center := 12, support := {11, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 12, support := {11, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cx := EdgeClosure.row 13 14 7
    (hrows ({ center := 13, support := {7, 12, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 13, support := {7, 12, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
  cb_cy := EdgeClosure.row 13 14 12
    (hrows ({ center := 13, support := {7, 12, 14} } : RowChoice Label)
      (by native_decide) (by native_decide))
    (hrows ({ center := 13, support := {7, 12, 14} } : RowChoice Label)
      (by native_decide) (by native_decide)) }

private theorem false_of_convexFiveForwardRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveForwardChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (convexFiveForwardCore hrows)
  · change signedArea2 (pointOf 5) (pointOf 9) (pointOf 2) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (5 : Label)) (k := (9 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (3 : Label)) (k := (4 : Label))
      (by decide) (by decide)

private theorem false_of_convexFiveReverseRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P convexFiveReverseChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal
    (convexFiveReverseCore hrows)
  · change 0 < signedArea2 (pointOf 11) (pointOf 7) (pointOf 14)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (7 : Label)) (j := (11 : Label)) (k := (14 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 14) (pointOf 13) (pointOf 12)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (12 : Label)) (j := (13 : Label)) (k := (14 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_convexFiveHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits convexFiveHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_convexFiveForwardRows hreal source.boundary_ccw
      (positiveRowsMatch_of_same source source.model.order direction rfl hsame
        convexFiveHits convexFiveForwardChoices convexFiveForwardCover hall)
  · exact false_of_convexFiveReverseRows hreal source.boundary_ccw
      (positiveRowsMatch_of_ne source source.model.order direction rfl hsame
        convexFiveHits convexFiveReverseChoices convexFiveReverseCover hall)

theorem sourceAssign_convexFiveClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (priorOccurrenceClause convexFiveHits order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_convexFiveHits source order direction horder.symm hall

/- ## Complete suffix and successor CNF -/

def twentyFirstOccurrenceHits : List (List Hit) :=
  [bisectorHits, convexFiveHits]

def twentyFirstModelRefinementClauses : Std.Sat.CNF Atom :=
  twentyFirstOccurrenceHits.flatMap priorOccurrenceClauses

theorem twentyFirstModelRefinementClauses_length :
    twentyFirstModelRefinementClauses.length = 8 := by
  native_decide

theorem sourceAssign_twentyFirstModelRefinementClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ twentyFirstModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twentyFirstModelRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨hits, hhits, hclause⟩
  simp only [twentyFirstOccurrenceHits, List.mem_cons, List.not_mem_nil,
    or_false] at hhits
  simp only [priorOccurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  rcases hhits with rfl | rfl
  · exact sourceAssign_bisectorClause source order direction
  · exact sourceAssign_convexFiveClause source order direction

def extendedTwentyFirstModelRefinementsCnf : Std.Sat.CNF Atom :=
  ATailBlockerVExactSeventeenTwentiethModelRefinements.extendedTwentiethModelRefinementsCnf ++
    twentyFirstModelRefinementClauses

theorem extendedTwentyFirstModelRefinementsCnf_length :
    extendedTwentyFirstModelRefinementsCnf.length = 5846208 := by
  native_decide

theorem sourceAssign_extendedTwentyFirstModelRefinementsCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedTwentyFirstModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedTwentyFirstModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h :=
      ATailBlockerVExactSeventeenTwentiethModelRefinements.sourceAssign_extendedTwentiethModelRefinementsCnf
        source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_twentyFirstModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedTwentyFirstModelRefinementsCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedTwentyFirstModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedTwentyFirstModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedTwentyFirstModelRefinementsCnf

end ATailBlockerVExactSeventeenTwentyFirstModelRefinements
end Problem97
