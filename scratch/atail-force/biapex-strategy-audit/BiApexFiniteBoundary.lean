/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrdinalKalmansonCycle

/-!
# Finite boundary for the bi-apex blocker-multiplicity route

This is a finite row/blocker abstraction, not a Euclidean counterexample.  It
retains both blocker-image omissions, two nontrivial blocker fibers, parent
radius/deletion data, exact support locking, and the selected-row closure
consequence of minimality, while avoiding the known ordered cross-row
terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBiApexFiniteBoundary

open ATailOrdinalKalmansonCycle

abbrev Label := Fin 12

def firstApex : Label := 4
def secondApex : Label := 8
def firstCollisionSource₁ : Label := 1
def firstCollisionSource₂ : Label := 2
def firstCollisionCenter : Label := 0
def secondCollisionSource₁ : Label := 3
def secondCollisionSource₂ : Label := 7
def secondCollisionCenter : Label := 5
def robustRowPartner : Label := 7
def frontierSource : Label := 1
def frontierCompanion : Label := 2

def firstApexRobustClass : Finset Label := {1, 5, 6, 7, 8}
def secondApexRobustClass : Finset Label := {0, 3, 5, 6, 7}
def firstApexDoubleClass : Finset Label := {5, 6, 7, 8}
def secondApexDoubleClass : Finset Label := {0, 3, 5, 6}

/-- The map omits both physical apices and has exactly two double fibers. -/
def blocker : Label → Label :=
  ![2, 0, 0, 5, 3, 6, 7, 5, 9, 10, 11, 1]

/-- The first collision/robust-row prefix is deliberately present.  The rows
also form a strongly connected selected-witness digraph. -/
def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {2, 3, 4, 11},
    {0, 3, 4, 5},
    {2, 4, 5, 6},
    {1, 6, 7, 8},
    {3, 6, 7, 8},
    {5, 7, 8, 9},
    {6, 8, 9, 10},
    {7, 9, 10, 11},
    {0, 8, 10, 11},
    {0, 1, 9, 11},
    {0, 1, 2, 10}]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRow center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

theorem total_critical_system_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ x y : Label, blocker x = blocker y →
      criticalSupport x = criticalSupport y) := by
  decide

theorem biApex_parent_radius_surface_checked :
    firstApexRobustClass.card = 5 ∧
    secondApexRobustClass.card = 5 ∧
    firstApex ∉ firstApexRobustClass ∧
    secondApex ∉ secondApexRobustClass ∧
    (∀ deleted : Label, 4 ≤ (firstApexRobustClass.erase deleted).card) ∧
    (∀ deleted : Label, 4 ≤ (secondApexRobustClass.erase deleted).card) ∧
    firstApexDoubleClass.card = 4 ∧
    frontierSource ∉ firstApexDoubleClass ∧
    frontierCompanion ∉ firstApexDoubleClass ∧
    secondApexDoubleClass.card = 4 ∧
    frontierSource ∉ secondApexDoubleClass ∧
    frontierCompanion ∉ secondApexDoubleClass ∧
    firstApex ≠ secondApex := by
  decide

theorem two_omissions_two_double_fibers_checked :
    (∀ source : Label, blocker source ≠ firstApex) ∧
    (∀ source : Label, blocker source ≠ secondApex) ∧
    firstCollisionSource₁ ≠ firstCollisionSource₂ ∧
    blocker firstCollisionSource₁ = firstCollisionCenter ∧
    blocker firstCollisionSource₂ = firstCollisionCenter ∧
    secondCollisionSource₁ ≠ secondCollisionSource₂ ∧
    blocker secondCollisionSource₁ = secondCollisionCenter ∧
    blocker secondCollisionSource₂ = secondCollisionCenter ∧
    firstCollisionCenter ≠ secondCollisionCenter ∧
    (∀ a b : Label, a ≠ b → blocker a = blocker b →
      blocker a = firstCollisionCenter ∨
        blocker a = secondCollisionCenter) := by
  decide

theorem collision_and_robust_row_prefix_checked :
    firstCollisionSource₁ ∈ globalRow firstApex ∧
    robustRowPartner ∈ globalRow firstApex ∧
    firstCollisionSource₁ ∈ globalRow firstCollisionCenter ∧
    firstCollisionSource₂ ∈ globalRow firstCollisionCenter := by
  decide

/-- The known six-role ordinal terminal still lacks its cross-support row.
The second collision by itself does not create the needed row through
`robustRowPartner` and `firstCollisionSource₂`. -/
theorem no_ordered_crossRow_completion_checked :
    ¬ ∃ center : Label,
      center ≠ firstApex ∧ center ≠ firstCollisionCenter ∧
      robustRowPartner ∈ globalRow center ∧
      firstCollisionSource₂ ∈ globalRow center := by
  decide

/-- The complete represented row system does not avoid generic ordinal
closure.  Already on `0 < 1 < 2 < 3`, row `0` and row `1` both contain
`2,3`: row `0` therefore forces `d(1,2) < d(1,3)`, while row `1` identifies
those same two distance terms. -/
theorem full_ordinal_strict_loop_incidence_checked :
    (2 : Label) ∈ globalRow 0 ∧
    (3 : Label) ∈ globalRow 0 ∧
    (2 : Label) ∈ globalRow 1 ∧
    (3 : Label) ∈ globalRow 1 := by
  decide

/-- Two nested rows in the `0 < 1 < 2 < 3` incidence pattern instantiate a
one-edge `SelectedRowOrdinalComparison` cycle after the second row identifies
the two named distance terms.  This is the geometric meaning of
`full_ordinal_strict_loop_incidence_checked`. -/
theorem false_of_nested_rows_full_ordinal_loop
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (row0 : SelectedFourClass carrier (boundary i0))
    (row1 : SelectedFourClass carrier (boundary i1))
    (hi2row0 : boundary i2 ∈ row0.support)
    (hi3row0 : boundary i3 ∈ row0.support)
    (hi2row1 : boundary i2 ∈ row1.support)
    (hi3row1 : boundary i3 ∈ row1.support) : False := by
  let value : Unit → ℝ := fun _ ↦ dist (boundary i1) (boundary i2)
  have hright : value () = dist (boundary i1) (boundary i3) := by
    exact (row1.support_eq_radius _ hi2row1).trans
      (row1.support_eq_radius _ hi3row1).symm
  have step :
      SelectedRowOrdinalComparison boundary value () () :=
    SelectedRowOrdinalComparison.diagonalEqSide h01 h12 h23 row0
      hi2row0 hi3row0 rfl hright
  exact false_of_transGen_cycle hcarrier hboundary_injective
    hboundary_image hboundary_ccw (Relation.TransGen.single step)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
theorem minimal_row_closure_surface_checked :
    ∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ := by
  decide

#print axioms total_critical_system_checked
#print axioms biApex_parent_radius_surface_checked
#print axioms two_omissions_two_double_fibers_checked
#print axioms collision_and_robust_row_prefix_checked
#print axioms no_ordered_crossRow_completion_checked
#print axioms full_ordinal_strict_loop_incidence_checked
#print axioms false_of_nested_rows_full_ordinal_loop
#print axioms minimal_row_closure_surface_checked

end ATailBiApexFiniteBoundary
end Problem97
