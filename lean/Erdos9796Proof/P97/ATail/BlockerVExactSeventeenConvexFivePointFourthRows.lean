/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenConvexFivePointThirdRows

/-!
# Two further three-row convex five-point clauses for exact seventeen

The terminal SAT model of the preceding child contains two additional
five-point metric obstructions, each supported by only three selected rows.
This module banks both complete two-order, two-orientation orbits and extends
the Lean-owned CNF by eight clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenConvexFivePointFourthRows

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDE
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailBlockerVExactSeventeenConvexFivePointThirdRows
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

/-- Transport a positional hit pattern into one named source order and
orientation. -/
def orientedHits (hits : List Hit) (order : NamedOrder)
    (direction : Orientation) : List Hit :=
  hits.map fun hit =>
    (orientedLabelAtPosition order direction hit.1,
      orientedLabelAtPosition order direction hit.2)

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

private theorem positiveRowsMatch_same {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hsame : source.orientation = direction)
    (choices : List (RowChoice Label)) (hits : List Hit)
    (hcovers : ∀ choice ∈ choices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ hits)
    (hall : ∀ hit ∈ orientedHits hits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      choices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  rw [sourceIndexEquiv_symm_eq_of_same _ _ _ hsame]
  exact hall
    (orientedLabelAtPosition source.model.order direction choice.center,
      orientedLabelAtPosition source.model.order direction point)
    (by
      simp only [orientedHits, List.mem_map]
      exact ⟨(choice.center, point),
        hcovers choice hchoice point hpoint, rfl⟩)

private theorem positiveRowsMatch_reflected {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hne : source.orientation ≠ direction)
    (choices : List (RowChoice Label)) (hits : List Hit)
    (hcovers : ∀ choice ∈ choices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ hits)
    (hall : ∀ hit ∈ orientedHits hits order direction,
      hit.2 ∈ source.model.selected hit.1) :
    PositiveRowsMatch
      (reindexRowPattern
        (sourceIndexEquiv source.model.order source.orientation)
        source.model.selected)
      choices := by
  subst order
  intro choice hchoice point hpoint
  rw [mem_reindexRowPattern_iff]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  rw [sourceIndexEquiv_symm_eq_reflected_of_ne _ _ _ hne]
  exact hall
    (orientedLabelAtPosition source.model.order direction (Fin.rev choice.center),
      orientedLabelAtPosition source.model.order direction (Fin.rev point))
    (by
      simp only [orientedHits, List.mem_map]
      exact ⟨(Fin.rev choice.center, Fin.rev point),
        hcovers choice hchoice point hpoint, rfl⟩)

private theorem signedArea2_swap12 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 b a c := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 c b a := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  simp only [signedArea2]
  ring

/- ## First obstruction from the twelfth child -/

def firstChoices : List (RowChoice Label) :=
  [{ center := 1, support := {0, 10} },
    { center := 13, support := {0, 10} },
    { center := 14, support := {0, 1, 13} }]

def firstReflectedChoices : List (RowChoice Label) :=
  [{ center := 15, support := {6, 16} },
    { center := 3, support := {6, 16} },
    { center := 2, support := {3, 15, 16} }]

def firstHits : List Hit :=
  [(1, 0), (1, 10), (13, 0), (13, 10),
    (14, 0), (14, 1), (14, 13)]

private theorem firstHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ firstChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ firstHits := by
  native_decide +revert

private theorem firstHit_of_reflectedChoice (choice : RowChoice Label)
    (hchoice : choice ∈ firstReflectedChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ firstHits := by
  native_decide +revert

private def firstCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P firstChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 10
    x := 1
    b := 0
    c := 14
    y := 13
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 1 10 0
      (hrows ({ center := 1, support := {0, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 1, support := {0, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 13 10 0
      (hrows ({ center := 13, support := {0, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 13, support := {0, 10} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 14 0 1
      (hrows ({ center := 14, support := {0, 1, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 14, support := {0, 1, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 14 0 13
      (hrows ({ center := 14, support := {0, 1, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 14, support := {0, 1, 13} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private def firstReflectedCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P firstReflectedChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 6
    x := 15
    b := 16
    c := 2
    y := 3
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 15 6 16
      (hrows ({ center := 15, support := {6, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 15, support := {6, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 3 6 16
      (hrows ({ center := 3, support := {6, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 3, support := {6, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 2 16 15
      (hrows ({ center := 2, support := {3, 15, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 2, support := {3, 15, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 2 16 3
      (hrows ({ center := 2, support := {3, 15, 16} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 2, support := {3, 15, 16} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private theorem false_of_firstRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P firstChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal (firstCore hrows)
  · change 0 < signedArea2 (pointOf 10) (pointOf 1) (pointOf 0)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (1 : Label)) (k := (10 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 0) (pointOf 14) (pointOf 13)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (13 : Label)) (k := (14 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_firstReflectedRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P firstReflectedChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (firstReflectedCore hrows)
  · change signedArea2 (pointOf 6) (pointOf 15) (pointOf 16) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (6 : Label)) (j := (15 : Label)) (k := (16 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 16) (pointOf 2) (pointOf 3) < 0
    have hshift : ∀ {i j k : Label}, i < j → j < k →
        signedArea2 (pointOf (i + 16)) (pointOf (j + 16))
          (pointOf (k + 16)) < 0 :=
      hneg_cyclicShift (φ := pointOf)
        (hneg_of_ccw hreal.injective hccw) (16 : Label)
    exact hshift (i := (0 : Label)) (j := (3 : Label)) (k := (4 : Label))
      (by decide) (by decide)

/- ## Second obstruction from the twelfth child -/

def secondChoices : List (RowChoice Label) :=
  [{ center := 15, support := {2, 13} },
    { center := 4, support := {2, 13} },
    { center := 3, support := {2, 4, 15} }]

def secondReflectedChoices : List (RowChoice Label) :=
  [{ center := 1, support := {3, 14} },
    { center := 12, support := {3, 14} },
    { center := 13, support := {1, 12, 14} }]

def secondHits : List Hit :=
  [(15, 2), (15, 13), (4, 2), (4, 13),
    (3, 2), (3, 4), (3, 15)]

private theorem secondHit_of_choice (choice : RowChoice Label)
    (hchoice : choice ∈ secondChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (choice.center, point) ∈ secondHits := by
  native_decide +revert

private theorem secondHit_of_reflectedChoice (choice : RowChoice Label)
    (hchoice : choice ∈ secondReflectedChoices) (point : Label)
    (hpoint : point ∈ choice.support) :
    (Fin.rev choice.center, Fin.rev point) ∈ secondHits := by
  native_decide +revert

private def secondCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P secondChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 13
    x := 15
    b := 2
    c := 3
    y := 4
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 15 13 2
      (hrows ({ center := 15, support := {2, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 15, support := {2, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 4 13 2
      (hrows ({ center := 4, support := {2, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 4, support := {2, 13} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 3 2 15
      (hrows ({ center := 3, support := {2, 4, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 3, support := {2, 4, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 3 2 4
      (hrows ({ center := 3, support := {2, 4, 15} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 3, support := {2, 4, 15} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private def secondReflectedCore {P : RowPattern Label}
    (hrows : PositiveRowsMatch P secondReflectedChoices) :
    Census554.ConvexFivePointCore.Core P :=
  { a := 3
    x := 1
    b := 14
    c := 13
    y := 12
    hab := by decide
    hxy := by decide
    xa_xb := EdgeClosure.row 1 3 14
      (hrows ({ center := 1, support := {3, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 1, support := {3, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
    ya_yb := EdgeClosure.row 12 3 14
      (hrows ({ center := 12, support := {3, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 12, support := {3, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cx := EdgeClosure.row 13 14 1
      (hrows ({ center := 13, support := {1, 12, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 13, support := {1, 12, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
    cb_cy := EdgeClosure.row 13 14 12
      (hrows ({ center := 13, support := {1, 12, 14} } : RowChoice Label)
        (by native_decide) (by native_decide))
      (hrows ({ center := 13, support := {1, 12, 14} } : RowChoice Label)
        (by native_decide) (by native_decide)) }

private theorem false_of_secondRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P secondChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core_of_neg hreal
    (secondCore hrows)
  · change signedArea2 (pointOf 13) (pointOf 15) (pointOf 2) < 0
    have hshift : ∀ {i j k : Label}, i < j → j < k →
        signedArea2 (pointOf (i + 13)) (pointOf (j + 13))
          (pointOf (k + 13)) < 0 :=
      hneg_cyclicShift (φ := pointOf)
        (hneg_of_ccw hreal.injective hccw) (13 : Label)
    exact hshift (i := (0 : Label)) (j := (2 : Label)) (k := (6 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 2) (pointOf 3) (pointOf 4) < 0
    exact hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (3 : Label)) (k := (4 : Label))
      (by decide) (by decide)

private theorem false_of_secondReflectedRows
    {P : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P secondReflectedChoices) : False := by
  apply Census554.ConvexFivePointCore.false_of_core hreal
    (secondReflectedCore hrows)
  · change 0 < signedArea2 (pointOf 3) (pointOf 1) (pointOf 14)
    rw [signedArea2_swap12]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (3 : Label)) (k := (14 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 14) (pointOf 13) (pointOf 12)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (12 : Label)) (j := (13 : Label)) (k := (14 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_firstHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ orientedHits firstHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_firstRows hreal source.boundary_ccw
      (positiveRowsMatch_same source source.model.order direction rfl hsame
        firstChoices firstHits firstHit_of_choice hall)
  · exact false_of_firstReflectedRows hreal source.boundary_ccw
      (positiveRowsMatch_reflected source source.model.order direction rfl hsame
        firstReflectedChoices firstHits firstHit_of_reflectedChoice hall)

private theorem false_of_secondHits {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ orientedHits secondHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_secondRows hreal source.boundary_ccw
      (positiveRowsMatch_same source source.model.order direction rfl hsame
        secondChoices secondHits secondHit_of_choice hall)
  · exact false_of_secondReflectedRows hreal source.boundary_ccw
      (positiveRowsMatch_reflected source source.model.order direction rfl hsame
        secondReflectedChoices secondHits secondHit_of_reflectedChoice hall)

def firstClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom :=
  nogoodClause order (orientedHits firstHits order direction)

def secondClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom :=
  nogoodClause order (orientedHits secondHits order direction)

theorem sourceAssign_firstClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (firstClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_firstHits source order direction horder.symm hall

theorem sourceAssign_secondClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (secondClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_secondHits source order direction horder.symm hall

def firstClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => firstClause order direction

def secondClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction => secondClause order direction

def fourthRowClauses : Std.Sat.CNF Atom := firstClauses ++ secondClauses

theorem firstClauses_length : firstClauses.length = 4 := by
  native_decide

theorem secondClauses_length : secondClauses.length = 4 := by
  native_decide

theorem fourthRowClauses_length : fourthRowClauses.length = 8 := by
  simp [fourthRowClauses, firstClauses_length, secondClauses_length]

theorem sourceAssign_fourthRowClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ fourthRowClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fourthRowClauses, List.mem_append] at hclause
  rcases hclause with hfirst | hsecond
  · simp only [firstClauses, List.mem_flatMap, List.mem_map] at hfirst
    obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hfirst
    exact sourceAssign_firstClause source order direction
  · simp only [secondClauses, List.mem_flatMap, List.mem_map] at hsecond
    obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hsecond
    exact sourceAssign_secondClause source order direction

/-- Lean-owned successor root after both newly mined three-row orbits. -/
def extendedFourthRowCnf : Std.Sat.CNF Atom :=
  extendedConvexFivePointCnf ++ fourthRowClauses

theorem extendedFourthRowCnf_clause_count :
    extendedFourthRowCnf.length = 5846096 := by
  simp [extendedFourthRowCnf, extendedConvexFivePointCnf_clause_count,
    fourthRowClauses_length]

/-- The first new clause at named order zero and forward orientation is exactly
the first source-backed hit in the replayed twelfth model. -/
theorem first_orderZero_forward_hits :
    orientedHits firstHits 0 .forward =
      [(6, 0), (6, 16), (5, 0), (5, 16),
        (1, 0), (1, 6), (1, 5)] := by
  native_decide

/-- The second new clause at named order zero and forward orientation is
exactly the second source-backed hit in the replayed twelfth model. -/
theorem second_orderZero_forward_hits :
    orientedHits secondHits 0 .forward =
      [(13, 8), (13, 5), (10, 8), (10, 5),
        (11, 8), (11, 10), (11, 13)] := by
  native_decide

/-- Gate B for the successor root containing both twelfth-model refinements. -/
theorem sourceAssign_extendedFourthRowCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFourthRowCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFourthRowCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedConvexFivePointCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_fourthRowClauses source clause hnew

/-- Certificate-to-source landing contract for the successor root. -/
theorem false_of_sourceRealization_of_extendedFourthRowCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFourthRowCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model, sourceAssign_extendedFourthRowCnf source⟩

#print axioms sourceAssign_firstClause
#print axioms sourceAssign_secondClause
#print axioms sourceAssign_extendedFourthRowCnf

end ATailBlockerVExactSeventeenConvexFivePointFourthRows
end Problem97
