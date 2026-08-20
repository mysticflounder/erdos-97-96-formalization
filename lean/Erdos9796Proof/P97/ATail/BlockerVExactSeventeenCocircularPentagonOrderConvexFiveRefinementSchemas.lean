/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenConvexFiveSourceBridge

/-!
# Seven-hit convex-five refinement from the second cocircular-order SAT child

The second authenticated SAT model contains the physical incidences
`(11,1),(11,8),(0,1),(0,8),(6,8),(6,11),(6,0)`.  Under the named-order table
these are the positional rows recorded below.  The reusable checked bridge
turns the four direct row equalities and elementary CCW signs into four
source-valid named-order/orientation clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCocircularPentagonOrderConvexFiveRefinementSchemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenConvexFiveSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore

def cocircularOrderConvexFiveHits : List Hit :=
  [(3, 14), (3, 2), (0, 14), (0, 2),
    (1, 2), (1, 3), (1, 0)]

def cocircularOrderConvexFiveForwardChoices : List (RowChoice Label) :=
  [{ center := 3, support := {2, 14} },
    { center := 0, support := {2, 14} },
    { center := 1, support := {0, 2, 3} }]

def cocircularOrderConvexFiveReverseChoices : List (RowChoice Label) :=
  [{ center := 13, support := {2, 14} },
    { center := 16, support := {2, 14} },
    { center := 15, support := {13, 14, 16} }]

def cocircularOrderConvexFiveForwardData : ConvexFivePointData Label :=
  { a := 14
    x := 3
    b := 2
    c := 1
    y := 0
    xa_xb := ⟨(3, 14), [.row 3 14 2], (3, 2)⟩
    ya_yb := ⟨(0, 14), [.row 0 14 2], (0, 2)⟩
    cb_cx := ⟨(1, 2), [.row 1 2 3], (1, 3)⟩
    cb_cy := ⟨(1, 2), [.row 1 2 0], (1, 0)⟩ }

def cocircularOrderConvexFiveReverseData : ConvexFivePointData Label :=
  { a := 2
    x := 13
    b := 14
    c := 15
    y := 16
    xa_xb := ⟨(13, 2), [.row 13 2 14], (13, 14)⟩
    ya_yb := ⟨(16, 2), [.row 16 2 14], (16, 14)⟩
    cb_cx := ⟨(15, 14), [.row 15 14 13], (15, 13)⟩
    cb_cy := ⟨(15, 14), [.row 15 14 16], (15, 16)⟩ }

def cocircularOrderConvexFiveOccurrence : ConvexFiveSourceOccurrence :=
  { hits := cocircularOrderConvexFiveHits
    forwardChoices := cocircularOrderConvexFiveForwardChoices
    reverseChoices := cocircularOrderConvexFiveReverseChoices
    forwardData := cocircularOrderConvexFiveForwardData
    reverseData := cocircularOrderConvexFiveReverseData
    forwardOrientation := by
      intro pointOf hinjective hccw
      constructor
      · change 0 < signedArea2 (pointOf 14) (pointOf 3) (pointOf 2)
        rw [signedArea2_swap13]
        have hneg := hneg_of_ccw hinjective hccw
          (i := (2 : Label)) (j := (3 : Label)) (k := (14 : Label))
          (by decide) (by decide)
        linarith
      · change 0 < signedArea2 (pointOf 2) (pointOf 1) (pointOf 0)
        rw [signedArea2_swap13]
        have hneg := hneg_of_ccw hinjective hccw
          (i := (0 : Label)) (j := (1 : Label)) (k := (2 : Label))
          (by decide) (by decide)
        linarith
    reverseOrientation := by
      intro pointOf hinjective hccw
      constructor
      · exact hneg_of_ccw hinjective hccw
          (i := (2 : Label)) (j := (13 : Label)) (k := (14 : Label))
          (by decide) (by decide)
      · exact hneg_of_ccw hinjective hccw
          (i := (14 : Label)) (j := (15 : Label)) (k := (16 : Label))
          (by decide) (by decide) }

theorem cocircularOrderConvexFiveOccurrence_check :
    cocircularOrderConvexFiveOccurrence.check = true := by
  decide

def cocircularOrderConvexFiveRefinementClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.map fun direction =>
      convexFiveOccurrenceClause order direction
        cocircularOrderConvexFiveOccurrence

theorem cocircularOrderConvexFiveRefinementClauses_length :
    cocircularOrderConvexFiveRefinementClauses.length = 4 := by
  decide

theorem sourceAssign_cocircularOrderConvexFiveRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ cocircularOrderConvexFiveRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [cocircularOrderConvexFiveRefinementClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with ⟨order, _, direction, _, rfl⟩
  exact sourceAssign_convexFiveOccurrenceClause source
    cocircularOrderConvexFiveOccurrence
    cocircularOrderConvexFiveOccurrence_check order direction

theorem cocircularOrderConvexFive_orderZero_forward_dimacs :
    (convexFiveOccurrenceClause 0 .forward
      cocircularOrderConvexFiveOccurrence).map litToDimacs =
      [-307, -189, -196, -2, -9, -111, -114, -103] := by
  decide

theorem cocircularOrderConvexFive_orderZero_reverse_dimacs :
    (convexFiveOccurrenceClause 0 .reverse
      cocircularOrderConvexFiveOccurrence).map litToDimacs =
      [-307, -94, -87, -247, -240, -223, -227, -236] := by
  decide

theorem cocircularOrderConvexFive_orderOne_forward_dimacs :
    (convexFiveOccurrenceClause 1 .forward
      cocircularOrderConvexFiveOccurrence).map litToDimacs =
      [-308, -189, -196, -2, -9, -111, -114, -103] := by
  decide

theorem cocircularOrderConvexFive_orderOne_reverse_dimacs :
    (convexFiveOccurrenceClause 1 .reverse
      cocircularOrderConvexFiveOccurrence).map litToDimacs =
      [-308, -94, -87, -247, -240, -223, -227, -236] := by
  decide

#print axioms cocircularOrderConvexFiveOccurrence_check
#print axioms sourceAssign_cocircularOrderConvexFiveRefinementClauses
#print axioms cocircularOrderConvexFive_orderZero_forward_dimacs

end ATailBlockerVExactSeventeenCocircularPentagonOrderConvexFiveRefinementSchemas
end Problem97
