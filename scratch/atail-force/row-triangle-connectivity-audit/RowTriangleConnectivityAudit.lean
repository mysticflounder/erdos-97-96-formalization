/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Selected-row connectivity versus an ordinal row triangle

The first half records the exact source-faithful consequence of minimality:
after prescribing two selected rows, the remaining rows can be chosen so that
the resulting single-membership witness digraph is strongly connected.

The second half is a finite incidence regression. It retains row closure,
hence strong connectivity, together with a total exact-support blocker map
whose image omits one robust center and whose only nontrivial fiber is the
displayed collision. Nevertheless it has no `O,A,X` support triangle. This is
not a Euclidean counterexample; it isolates the missing pair-membership
producer between connectivity and the ordinal Kalmanson terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRowTriangleConnectivityAuditScratch

attribute [local instance] Classical.propDecidable

/-- The directed edge relation supplied by one selected support membership. -/
def SelectedWitnessEdge {A : Finset ℝ²} (P : FaithfulCarrierPattern A)
    (center target : ℝ²) : Prop :=
  ∃ hcenter : center ∈ A, target ∈ (P.classAt center hcenter).support

/-- Minimality makes every faithful selected-row digraph strongly connected. -/
theorem selectedWitnessEdge_reflTransGen
    {D : CounterexampleData} (hmin : D.Minimal)
    (P : FaithfulCarrierPattern D.A) {source target : ℝ²}
    (hsource : source ∈ D.A) (htarget : target ∈ D.A) :
    Relation.ReflTransGen (SelectedWitnessEdge P) source target := by
  classical
  let reachable : Finset ℝ² :=
    D.A.filter fun z ↦ Relation.ReflTransGen (SelectedWitnessEdge P) source z
  have hreachable_nonempty : reachable.Nonempty := by
    refine ⟨source, Finset.mem_filter.mpr ⟨hsource, ?_⟩⟩
    exact Relation.ReflTransGen.refl
  have hreachable_subset : reachable ⊆ D.A := by
    intro z hz
    exact (Finset.mem_filter.mp hz).1
  have hreachable_closed :
      ∀ center : ℝ², ∀ hcenter : center ∈ reachable,
        (P.classAt center (hreachable_subset hcenter)).support ⊆ reachable := by
    intro center hcenter z hz
    have hpath : Relation.ReflTransGen (SelectedWitnessEdge P) source center :=
      (Finset.mem_filter.mp hcenter).2
    have hedge : SelectedWitnessEdge P center z :=
      ⟨hreachable_subset hcenter, hz⟩
    exact Finset.mem_filter.mpr
      ⟨(P.classAt center (hreachable_subset hcenter)).support_subset_A hz,
        hpath.tail hedge⟩
  have hreachable_eq : reachable = D.A :=
    P.eq_carrier_of_nonempty_closed hmin hreachable_nonempty
      hreachable_subset hreachable_closed
  have htarget_reachable : target ∈ reachable := by
    rw [hreachable_eq]
    exact htarget
  exact (Finset.mem_filter.mp htarget_reachable).2

/-- Two prescribed selected rows can be retained simultaneously, but the
minimality conclusion remains only a path of one-point support memberships. -/
theorem exists_two_prescribed_rows_with_global_connectivity
    {D : CounterexampleData} (hmin : D.Minimal)
    {firstCenter secondCenter : ℝ²}
    (hfirst : firstCenter ∈ D.A) (hsecond : secondCenter ∈ D.A)
    (hcenters : firstCenter ≠ secondCenter)
    (firstRow : SelectedFourClass D.A firstCenter)
    (secondRow : SelectedFourClass D.A secondCenter) :
    ∃ P : FaithfulCarrierPattern D.A,
      (P.classAt firstCenter hfirst).support = firstRow.support ∧
      (P.classAt secondCenter hsecond).support = secondRow.support ∧
      ∀ source target : ℝ², source ∈ D.A → target ∈ D.A →
        Relation.ReflTransGen (SelectedWitnessEdge P) source target := by
  rcases exists_faithfulCarrierPattern_with_two_classes D.K4 hfirst hsecond
      hcenters firstRow secondRow with ⟨P, hfirstRow, hsecondRow⟩
  exact ⟨P, hfirstRow, hsecondRow,
    fun _source _target hsource htarget ↦
      selectedWitnessEdge_reflTransGen hmin P hsource htarget⟩

namespace FiniteBoundary

abbrev Label := Fin 12

def robustCenter : Label := 4
def commonBlocker : Label := 0
def collisionSource₁ : Label := 1
def collisionSource₂ : Label := 2

/-- A five-member class witnessing the finite deletion-robustness shadow at
the omitted center. -/
def robustClass : Finset Label := {0, 1, 3, 6, 7}

/-- One four-point row at every represented center. -/
def row : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 2, 6, 7},
    {1, 3, 9, 10},
    {1, 4, 7, 11},
    {0, 1, 3, 6},
    {0, 3, 8, 11},
    {2, 7, 8, 10},
    {4, 6, 9, 11},
    {3, 5, 7, 9},
    {0, 4, 5, 10},
    {2, 5, 8, 11},
    {1, 6, 8, 9}]

/-- The image omits `robustCenter`; `commonBlocker` is its only repeated
value, with exactly the two displayed sources. -/
def blocker : Label → Label :=
  ![1, 0, 0, 2, 3, 10, 11, 6, 5, 8, 9, 7]

def criticalSupport (source : Label) : Finset Label :=
  row (blocker source)

def RowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, row center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (RowClosed U) := by
  unfold RowClosed
  infer_instance

/-- The finite exact-support blocker map has the robust omission and exactly
one nontrivial fiber. -/
theorem exact_single_collision_surface_checked :
    (∀ center : Label, (row center).card = 4) ∧
    (∀ center : Label, center ∉ row center) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, blocker source ≠ robustCenter) ∧
    robustClass.card = 5 ∧
    robustCenter ∉ robustClass ∧
    (∀ deleted : Label, 4 ≤ (robustClass.erase deleted).card) ∧
    collisionSource₁ ≠ collisionSource₂ ∧
    blocker collisionSource₁ = commonBlocker ∧
    blocker collisionSource₂ = commonBlocker ∧
    (∀ source : Label, blocker source = commonBlocker →
      source = collisionSource₁ ∨ source = collisionSource₂) ∧
    (∀ a b : Label, blocker a = blocker b →
      a = b ∨
        (a = collisionSource₁ ∧ b = collisionSource₂) ∨
        (a = collisionSource₂ ∧ b = collisionSource₁)) := by
  set_option maxRecDepth 100000 in
  set_option maxHeartbeats 2000000 in
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 2000000 in
/-- Exact finite counterpart of the selected-row closure consequence of
minimality. -/
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
    Relation.ReflTransGen (fun center point ↦ point ∈ next center)
      source target := by
  classical
  let reachable : Finset alpha :=
    Finset.univ.filter fun z ↦
      Relation.ReflTransGen (fun center point ↦ point ∈ next center) source z
  have hnonempty : reachable.Nonempty := by
    refine ⟨source, Finset.mem_filter.mpr ⟨Finset.mem_univ _, ?_⟩⟩
    exact Relation.ReflTransGen.refl
  have hnext : ∀ center ∈ reachable, next center ⊆ reachable := by
    intro center hcenter point hpoint
    have hpath := (Finset.mem_filter.mp hcenter).2
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hpath.tail hpoint⟩
  have hreached : reachable = Finset.univ := hclosed reachable hnonempty hnext
  have htarget : target ∈ reachable := by
    rw [hreached]
    exact Finset.mem_univ target
  exact (Finset.mem_filter.mp htarget).2

/-- The represented selected-row digraph is strongly connected. -/
theorem selected_row_graph_strongly_connected_checked
    (source target : Label) :
    Relation.ReflTransGen (fun center point ↦ point ∈ row center)
      source target :=
  reflTransGen_of_nonempty_closed_eq_univ row
    minimal_row_closure_surface_checked source target

/-- Despite strong connectivity and the exact single collision, the selected
rows contain no support-incidence realization of the required `O,A,X`
triangle, even before imposing its six-point cyclic order. -/
theorem no_ordered_row_triangle_incidence_checked :
    ¬ ∃ ordinaryCenter j : Label,
      List.Pairwise (fun x y : Label ↦ x ≠ y)
        [robustCenter, commonBlocker, ordinaryCenter, j,
          collisionSource₁, collisionSource₂] ∧
      j ∈ row robustCenter ∧
      collisionSource₁ ∈ row robustCenter ∧
      collisionSource₁ ∈ row commonBlocker ∧
      collisionSource₂ ∈ row commonBlocker ∧
      j ∈ row ordinaryCenter ∧
      collisionSource₂ ∈ row ordinaryCenter := by
  set_option maxRecDepth 100000 in
  set_option maxHeartbeats 2000000 in
  decide

#print axioms exact_single_collision_surface_checked
#print axioms minimal_row_closure_surface_checked
#print axioms selected_row_graph_strongly_connected_checked
#print axioms no_ordered_row_triangle_incidence_checked

end FiniteBoundary

#print axioms selectedWitnessEdge_reflTransGen
#print axioms exists_two_prescribed_rows_with_global_connectivity

end ATailRowTriangleConnectivityAuditScratch
end Problem97
