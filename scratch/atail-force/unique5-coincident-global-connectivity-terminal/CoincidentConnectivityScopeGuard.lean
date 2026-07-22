/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Coincident exact-five connectivity scope guard

This finite incidence model retains the exact consequences of global K4,
minimal row closure, a total source-indexed critical map, the exact-five
first-apex class, and the coincident-blocker continuation.  It nevertheless
has neither a genuinely new actual row through the collision pair nor the
ordered cross-row occurrence consumed by `OrderedCrossRowCore`.

The model is deliberately not asserted to be a Euclidean carrier.  It is a
scope guard for the proposed inference from strong connectivity and critical
source membership alone.
-/

namespace Problem97
namespace ATailUniqueFiveCoincidentGlobalConnectivityTerminalScratch

/-- The exact linear consumer exposed by the fixed-table Kalmanson audit.
Its five co-radial equalities and two strict cyclic-quadrilateral inequalities
are inconsistent.  This theorem is deliberately occurrence-agnostic: the
live residual does not currently force four of the five equalities. -/
theorem false_of_fiveCenter_twoKalmansonCore
    {o u v a x j : ℝ × ℝ}
    (ha : dist a o = dist a u)
    (ho : dist o j = dist o x)
    (hx : dist x v = dist x u)
    (hv : dist v o = dist v x)
    (hu : dist u j = dist u v)
    (hk₁ : dist o a + dist u v < dist o v + dist u a)
    (hk₂ : dist o j + dist u x < dist o x + dist u j) : False := by
  have ha' : dist o a = dist u a := by
    calc
      dist o a = dist a o := dist_comm _ _
      _ = dist a u := ha
      _ = dist u a := dist_comm _ _
  have hx' : dist x v = dist u x := hx.trans (dist_comm _ _)
  have hv' : dist o v = dist x v := by
    calc
      dist o v = dist v o := dist_comm _ _
      _ = dist v x := hv
      _ = dist x v := dist_comm _ _
  linarith

namespace FiniteScope

abbrev Label := Fin 12

def firstApex : Label := 4
def commonBlocker : Label := 0
def sourceQ : Label := 1
def sourceW : Label := 2
def jointSource : Label := 5
def freshSource : Label := 6
def freshBlocker : Label := 11

/-- The complete five-point first-apex radius class. -/
def firstClass : Finset Label := {1, 2, 3, 5, 6}

/-- The physical first opposite cap in the finite projection. -/
def firstCap : Finset Label := {0, 1, 2, 5, 6, 7, 11}

/-- One four-point row at every represented carrier center. -/
def row : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 4, 7, 8},
    {0, 3, 9, 10},
    {1, 4, 7, 11},
    {1, 2, 3, 6},
    {0, 3, 8, 11},
    {2, 7, 8, 10},
    {4, 6, 9, 11},
    {3, 5, 7, 9},
    {0, 4, 5, 10},
    {2, 5, 8, 11},
    {1, 6, 8, 9}]

/-- The total source-indexed blocker choice. -/
def blocker : Label → Label :=
  ![1, 0, 0, 2, 3, 10, 11, 6, 5, 8, 9, 7]

def criticalSupport (source : Label) : Finset Label :=
  row (blocker source)

def RowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, row center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (RowClosed U) := by
  unfold RowClosed
  infer_instance

/-- A counterclockwise boundary rank, cut at the first apex.  The first cap
is the consecutive block of ranks four through ten. -/
def boundaryRank : Label → Fin 12 :=
  ![6, 5, 7, 11, 0, 10, 8, 4, 1, 2, 3, 9]

def IsFiberOrientation (C K : Label) : Prop :=
  (C = sourceQ ∧ K = sourceW) ∨ (C = sourceW ∧ K = sourceQ)

/-- Finite projection of the ordered source-indexed terminal. -/
def OrderedCriticalFiberOccurrence : Prop :=
  ∃ J C K : Label,
    J ∈ firstClass ∧
      IsFiberOrientation C K ∧
      K ∈ criticalSupport J ∧
      boundaryRank firstApex < boundaryRank commonBlocker ∧
      boundaryRank commonBlocker < boundaryRank (blocker J) ∧
      boundaryRank (blocker J) < boundaryRank J ∧
      boundaryRank J < boundaryRank C ∧
      boundaryRank C < boundaryRank K

/-- The total four-row and blocker system is source-faithful. -/
theorem total_critical_row_surface_checked :
    (∀ center : Label, (row center).card = 4) ∧
    (∀ center : Label, center ∉ row center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ source : Label, blocker source ≠ firstApex) ∧
    (row firstApex ⊆ firstClass) ∧
    firstClass.card = 5 := by
  decide

/-- The model contains the complete coincident exact-five continuation and
joint-deletion incidence pattern. -/
theorem coincident_exactFive_continuation_surface_checked :
    sourceQ ∈ firstClass ∧
    sourceW ∈ firstClass ∧
    freshSource ∈ firstClass ∧
    jointSource ∈ firstClass ∧
    (∀ deleted : Label, 4 ≤ (firstClass.erase deleted).card) ∧
    ((firstClass.erase sourceQ).erase sourceW).card = 3 ∧
    blocker sourceQ = commonBlocker ∧
    blocker sourceW = commonBlocker ∧
    blocker freshSource = freshBlocker ∧
    freshBlocker ≠ commonBlocker ∧
    sourceQ ∈ criticalSupport sourceW ∧
    sourceW ∈ criticalSupport sourceQ ∧
    freshSource ∉ criticalSupport sourceQ ∧
    sourceW ∉ criticalSupport freshSource ∧
    jointSource ∉ criticalSupport sourceQ ∧
    jointSource ∉ criticalSupport freshSource ∧
    firstCap.card = 7 ∧
    commonBlocker ∈ firstCap ∧
    sourceQ ∈ firstCap ∧
    sourceW ∈ firstCap ∧
    freshSource ∈ firstCap ∧
    freshBlocker ∈ firstCap ∧
    firstApex ∉ firstCap ∧
    row commonBlocker ∩ firstCap = {sourceQ, sourceW} := by
  decide

/-- The cap and pair-owner bounds used by the local geometric consumers all
hold in the finite projection. -/
theorem cap_and_pair_owner_bounds_checked :
    (∀ center : Label, center ∈ firstCap →
      (row center ∩ firstCap).card ≤ 2) ∧
    (∀ c₁ c₂ : Label, c₁ ∈ firstCap → c₂ ∈ firstCap → c₁ ≠ c₂ →
      (((row c₁ \ firstCap) ∩ (row c₂ \ firstCap)).card ≤ 1)) ∧
    (∀ a b : Label, a ≠ b →
      ((Finset.univ.filter fun center ↦ a ∈ row center ∧ b ∈ row center).card ≤ 2)) := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
/-- The row system has no nonempty proper closed subset, the exact finite
counterpart of the minimal-carrier consequence used in the live argument. -/
theorem minimal_row_closure_surface_checked :
    ∀ U : Finset Label, U.Nonempty → RowClosed U → U = Finset.univ := by
  decide

/-- Generic finite closure-to-connectivity adapter. -/
theorem reflTransGen_of_nonempty_closed_eq_univ
    {alpha : Type*} [Fintype alpha] [DecidableEq alpha]
    (next : alpha → Finset alpha)
    (hclosed : ∀ U : Finset alpha, U.Nonempty →
      (∀ center ∈ U, next center ⊆ U) → U = Finset.univ)
    (source target : alpha) :
    Relation.ReflTransGen (fun center point ↦ point ∈ next center) source target := by
  classical
  let reachable : Finset alpha :=
    Finset.univ.filter fun z ↦
      Relation.ReflTransGen (fun center point ↦ point ∈ next center) source z
  have hnonempty : reachable.Nonempty := by
    exact ⟨source, Finset.mem_filter.mpr ⟨Finset.mem_univ _, Relation.ReflTransGen.refl⟩⟩
  have hnext : ∀ center ∈ reachable, next center ⊆ reachable := by
    intro center hcenter point hpoint
    have hpath := (Finset.mem_filter.mp hcenter).2
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hpath.tail hpoint⟩
  have hreached : reachable = Finset.univ := hclosed reachable hnonempty hnext
  have htarget : target ∈ reachable := by
    rw [hreached]
    exact Finset.mem_univ target
  exact (Finset.mem_filter.mp htarget).2

/-- Hence the represented selected-witness digraph is strongly connected. -/
theorem selected_row_graph_strongly_connected_checked
    (source target : Label) :
    Relation.ReflTransGen (fun center point ↦ point ∈ row center) source target :=
  reflTransGen_of_nonempty_closed_eq_univ row
    minimal_row_closure_surface_checked source target

/-- The only selected rows through the collision pair are the known common
blocker row and the robust first-apex row. -/
theorem only_known_centers_contain_collision_pair_checked :
    ∀ center : Label,
      sourceQ ∈ row center → sourceW ∈ row center →
        center = commonBlocker ∨ center = firstApex := by
  decide

/-- The total critical map therefore has no genuinely new actual blocker row
through both collision sources. -/
theorem no_distinct_actual_blocker_through_collision_pair_checked :
    ¬ ∃ source : Label,
      sourceQ ∈ criticalSupport source ∧
        sourceW ∈ criticalSupport source ∧
        blocker source ≠ commonBlocker := by
  decide

/-- Even the ordered cross-row terminal is absent in the fixed source-valid
boundary order of the model. -/
theorem no_ordered_criticalFiber_occurrence_checked :
    ¬ OrderedCriticalFiberOccurrence := by
  unfold OrderedCriticalFiberOccurrence IsFiberOrientation
  decide

#print axioms total_critical_row_surface_checked
#print axioms coincident_exactFive_continuation_surface_checked
#print axioms cap_and_pair_owner_bounds_checked
#print axioms minimal_row_closure_surface_checked
#print axioms reflTransGen_of_nonempty_closed_eq_univ
#print axioms selected_row_graph_strongly_connected_checked
#print axioms only_known_centers_contain_collision_pair_checked
#print axioms no_distinct_actual_blocker_through_collision_pair_checked
#print axioms no_ordered_criticalFiber_occurrence_checked
#print axioms false_of_fiveCenter_twoKalmansonCore

end FiniteScope

end ATailUniqueFiveCoincidentGlobalConnectivityTerminalScratch
end Problem97
