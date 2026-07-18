/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion

/-!
# Minimality forces every selected witness graph to have no proper sink

For every carrier point, choose an arbitrary four-point equal-radius row.
Global cardinal minimality says that no nonempty proper subset of the carrier
can contain every chosen target of all of its own centers.  This is the exact
cut used by the total all-center exact-six search; it is deliberately stated
without choosing a critical-shell system.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSelectedRowStrongConnectivityScratch

open ATailGlobalMinimalDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Every nonempty proper carrier subset has a chosen witness-row edge leaving
it.  Equivalently, the directed graph obtained by drawing an edge from every
center to each member of its selected four-point row has no proper sink
vertex set (and hence is strongly connected). -/
theorem exists_selectedRow_escape_of_minimal
    (D : CounterexampleData) (hmin : D.Minimal)
    (rowAt : (q : ↑D.A) → SelectedFourClass D.A q.1)
    {B : Finset ℝ²}
    (hBne : B.Nonempty)
    (hBA : B ⊆ D.A)
    (hBproper : B ≠ D.A) :
    ∃ q : ↑D.A, q.1 ∈ B ∧
      ∃ x : ℝ², x ∈ (rowAt q).support ∧ x ∉ B := by
  classical
  by_contra hescape
  have hBK4 : HasNEquidistantProperty 4 B := by
    intro q hqB
    let qA : ↑D.A := ⟨q, hBA hqB⟩
    let K : SelectedFourClass D.A q := rowAt qA
    refine ⟨K.radius, K.radius_pos, ?_⟩
    calc
      4 = K.support.card := K.support_card.symm
      _ ≤ (B.filter fun x ↦ dist q x = K.radius).card :=
        Finset.card_le_card (by
          intro x hx
          apply Finset.mem_filter.mpr
          refine ⟨?_, K.support_eq_radius x hx⟩
          by_contra hxB
          exact hescape ⟨qA, hqB, x, hx, hxB⟩)
  exact
    (not_hasNEquidistantProperty_of_nonempty_proper_subset
      hmin hBne hBA hBproper) hBK4

#print axioms exists_selectedRow_escape_of_minimal

end

end ATailSelectedRowStrongConnectivityScratch
end Problem97
