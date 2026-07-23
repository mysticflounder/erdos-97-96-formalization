/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite countermodels for the proposed exact-four row occurrence

These are countermodels to a documented incidence projection, not Euclidean
counterexamples and not inhabitants of `OriginalUniqueFourResidual`.

The projection retains one four-point nonself row at every carrier point, a
fixed-point-free actual-blocker map whose source lies in its blocker row, the
mutual first-apex two-cycle, an omitted completion center, the exact first-apex
blocker fiber, and selected-witness strong connectivity.  The displayed exact
row also has the required `2+1+1` cap distribution.

Both models avoid every cyclic or reflected six-role row triangle.  Thus neither
the mutual-center occurrence nor the weaker global existential follows from
these incidence fields alone.
-/

namespace Problem97
namespace UniqueFourOccurrenceFeasibilityScratch

abbrev Vertex := Fin 12

def p4Row : Vertex → Finset Vertex
  | 0 => {1, 5, 6, 11}
  | 1 => {0, 3, 6, 7}
  | 2 => {1, 4, 7, 8}
  | 3 => {2, 5, 7, 11}
  | 4 => {3, 6, 8, 9}
  | 5 => {0, 2, 6, 11}
  | 6 => {1, 2, 10, 11}
  | 7 => {1, 3, 5, 8}
  | 8 => {4, 5, 10, 11}
  | 9 => {3, 6, 10, 11}
  | 10 => {4, 6, 9, 11}
  | 11 => {5, 6, 9, 10}

def p4Blocker : Vertex → Vertex
  | 0 => 1
  | 1 => 0
  | 2 => 6
  | 3 => 7
  | 4 => 8
  | 5 => 0
  | 6 => 0
  | 7 => 3
  | 8 => 4
  | 9 => 4
  | 10 => 6
  | 11 => 0

def p5Row : Vertex → Finset Vertex
  | 0 => {1, 6, 7, 11}
  | 1 => {0, 2, 7, 8}
  | 2 => {1, 4, 7, 9}
  | 3 => {0, 2, 5, 11}
  | 4 => {1, 5, 9, 10}
  | 5 => {1, 3, 7, 8}
  | 6 => {2, 3, 8, 9}
  | 7 => {5, 6, 10, 11}
  | 8 => {2, 3, 7, 11}
  | 9 => {4, 7, 10, 11}
  | 10 => {5, 7, 9, 11}
  | 11 => {6, 7, 9, 10}

def p5Blocker : Vertex → Vertex
  | 0 => 1
  | 1 => 0
  | 2 => 6
  | 3 => 8
  | 4 => 9
  | 5 => 7
  | 6 => 0
  | 7 => 0
  | 8 => 6
  | 9 => 6
  | 10 => 4
  | 11 => 0

def allVertices : List Vertex := List.finRange 12

private def ltB (a b : Vertex) : Bool := decide (a < b)

private def increasingSix (a b c d e f : Vertex) : Bool :=
  ltB a b && ltB b c && ltB c d && ltB d e && ltB e f

/-- A six-tuple occurs in one of the two cyclic orientations. -/
def cyclicSix (a b c d e f : Vertex) : Bool :=
  increasingSix a b c d e f ||
  increasingSix b c d e f a ||
  increasingSix c d e f a b ||
  increasingSix d e f a b c ||
  increasingSix e f a b c d ||
  increasingSix f a b c d e ||
  increasingSix a f e d c b ||
  increasingSix f e d c b a ||
  increasingSix e d c b a f ||
  increasingSix d c b a f e ||
  increasingSix c b a f e d ||
  increasingSix b a f e d c

/-- Boolean incidence pattern consumed by
`false_of_two_k2_three_row_triangle`, allowing an arbitrary cyclic re-cut
and either boundary orientation. -/
def hasGlobalSixRoleTriangle (row : Vertex → Finset Vertex) : Bool :=
  allVertices.any fun i0 ↦
    allVertices.any fun i1 ↦
      allVertices.any fun i2 ↦
        allVertices.any fun i3 ↦
          allVertices.any fun i4 ↦
            allVertices.any fun i5 ↦
              cyclicSix i0 i1 i2 i3 i4 i5 &&
                decide (i3 ∈ row i0) && decide (i5 ∈ row i0) &&
                decide (i4 ∈ row i1) && decide (i5 ∈ row i1) &&
                decide (i3 ∈ row i2) && decide (i4 ∈ row i2)

/-- Incidence pattern consumed by `false_of_two_k2_three_row_triangle`. -/
def HasGlobalSixRoleTriangle (row : Vertex → Finset Vertex) : Prop :=
  hasGlobalSixRoleTriangle row = true

/-- Boolean selected-witness strong connectivity in cut form. -/
def stronglyConnectedRows (row : Vertex → Finset Vertex) : Bool :=
  allVertices.sublists.all fun U ↦
    if U = [] || U = allVertices then true
    else U.any fun center ↦
      allVertices.any fun point ↦
        decide (point ∉ U) && decide (point ∈ row center)

/-- The blocker/row fields used by the occurrence audit. -/
def blockerRowProjection
    (row : Vertex → Finset Vertex) (blocker : Vertex → Vertex) : Bool :=
  allVertices.all
      (fun center ↦ decide ((row center).card = 4 ∧ center ∉ row center)) &&
    allVertices.all
      (fun source ↦
        decide (blocker source ≠ source ∧ source ∈ row (blocker source))) &&
    decide (blocker 0 = 1 ∧ blocker 1 = 0) &&
    allVertices.all
      (fun source ↦ decide (blocker source = 0 ↔ source ∈ row 0)) &&
    allVertices.all
      (fun source ↦ decide (blocker source ≠ 2)) &&
    stronglyConnectedRows row

def BlockerRowProjection
    (row : Vertex → Finset Vertex) (blocker : Vertex → Vertex) : Prop :=
  blockerRowProjection row blocker = true

theorem p4_blockerRowProjection :
    blockerRowProjection p4Row p4Blocker = true := by
  native_decide

theorem p5_blockerRowProjection :
    blockerRowProjection p5Row p5Blocker = true := by
  native_decide

theorem p4_no_globalSixRoleTriangle :
    hasGlobalSixRoleTriangle p4Row = false := by
  native_decide

theorem p5_no_globalSixRoleTriangle :
    hasGlobalSixRoleTriangle p5Row = false := by
  native_decide

/-- In the four-point displayed-cap profile the exact row has two strict
opposite-cap hits and one hit in each adjacent closed cap. -/
theorem p4_exactRow_distribution :
    (p4Row 0 ∩ ({5, 6} : Finset Vertex)).card = 2 ∧
      (p4Row 0 ∩ ({0, 1, 2, 3, 4} : Finset Vertex)).card = 1 ∧
      (p4Row 0 ∩ ({0, 7, 8, 9, 10, 11} : Finset Vertex)).card = 1 := by
  decide

/-- The same source distribution in the five-point displayed-cap profile. -/
theorem p5_exactRow_distribution :
    (p5Row 0 ∩ ({5, 6, 7} : Finset Vertex)).card = 2 ∧
      (p5Row 0 ∩ ({0, 1, 2, 3, 4} : Finset Vertex)).card = 1 ∧
      (p5Row 0 ∩ ({0, 8, 9, 10, 11} : Finset Vertex)).card = 1 := by
  decide

#print axioms p4_blockerRowProjection
#print axioms p5_blockerRowProjection
#print axioms p4_no_globalSixRoleTriangle
#print axioms p5_no_globalSixRoleTriangle
#print axioms p4_exactRow_distribution
#print axioms p5_exactRow_distribution

end UniqueFourOccurrenceFeasibilityScratch
end Problem97
