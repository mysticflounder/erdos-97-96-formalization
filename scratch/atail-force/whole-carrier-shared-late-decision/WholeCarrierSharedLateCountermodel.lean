/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrdinalKalmansonCycle

/-!
# Whole-carrier countermodel to a shared-late-pair implication

This scratch file kernel-pins the independently verified card-ten SAT witness.
It is a finite row-incidence model, not a Euclidean realization and not a
model of the live critical-shell geometry.

The model has one four-point row at every cyclic label, pairwise row
intersection at most two, pair/bisector-center multiplicity at most two, a
strongly connected selected-row digraph, and a total fixed-point-free blocker
map whose image omits labels `0` and `1`.  Nevertheless it has no increasing
quadruple `a < b < c < d` for which rows `a` and `b` both contain `c,d`.
-/

namespace Problem97
namespace WholeCarrierSharedLateCountermodel

abbrev Label := Fin 10

/-- One selected four-support at every cyclic boundary label. -/
def row : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 2, 6, 7},
    {1, 4, 5, 6},
    {2, 4, 7, 9},
    {0, 3, 5, 9},
    {4, 6, 8, 9},
    {3, 5, 7, 8},
    {0, 1, 6, 8},
    {1, 5, 7, 9},
    {0, 2, 5, 8}]

/-- A total blocker map whose image omits the two prescribed values `0,1`. -/
def blocker : Label → Label :=
  ![4, 7, 3, 4, 3, 2, 5, 8, 5, 8]

/-- Directed selected-witness edge relation. -/
def SelectedEdge (center target : Label) : Prop := target ∈ row center

/-- A set is closed under every selected row at one of its centers. -/
def rowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, row center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (rowClosed U) := by
  unfold rowClosed
  infer_instance

/-- Centers whose rows contain one prescribed unordered carrier pair. -/
def pairCenters (first second : Label) : Finset Label :=
  Finset.univ.filter fun center => first ∈ row center ∧ second ∈ row center

/-- The production terminal's finite incidence antecedent. -/
def HasSharedLatePair : Prop :=
  ∃ a b c d : Label,
    a < b ∧ b < c ∧ c < d ∧
      c ∈ row a ∧ d ∈ row a ∧ c ∈ row b ∧ d ∈ row b

/-- Rotation-invariant strengthening of the terminal: on one increasing
quadruple, either cyclicly adjacent pair of vertices may be the two row
centers and the complementary adjacent pair the common supports. -/
def HasCyclicSharedPair : Prop :=
  ∃ a b c d : Label,
    a < b ∧ b < c ∧ c < d ∧
      ((c ∈ row a ∧ d ∈ row a ∧ c ∈ row b ∧ d ∈ row b) ∨
       (d ∈ row b ∧ a ∈ row b ∧ d ∈ row c ∧ a ∈ row c) ∨
       (a ∈ row c ∧ b ∈ row c ∧ a ∈ row d ∧ b ∈ row d) ∨
       (b ∈ row d ∧ c ∈ row d ∧ b ∈ row a ∧ c ∈ row a))

/-- All requested local row, pair, and blocker conditions hold. -/
theorem finite_surface_checked :
    (∀ center : Label, (row center).card = 4) ∧
    (∀ center : Label, center ∉ row center) ∧
    (∀ left right : Label, left ≠ right →
      ((row left) ∩ (row right)).card ≤ 2) ∧
    (∀ first second : Label, first ≠ second →
      (pairCenters first second).card ≤ 2) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ source : Label, blocker source ≠ 0) ∧
    (∀ source : Label, blocker source ≠ 1) ∧
    (∀ source : Label, source ∈ row (blocker source)) := by
  decide

set_option maxRecDepth 100000 in
/-- Exact finite cut characterization of strong connectivity: a nonempty set
closed under all outgoing selected-row edges is the whole carrier. -/
theorem no_nonempty_proper_rowClosed_checked :
    ∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ := by
  decide

/-- The cut check implies actual directed reachability between every ordered
pair of carrier labels. -/
theorem selectedEdge_reflTransGen (source target : Label) :
    Relation.ReflTransGen SelectedEdge source target := by
  classical
  let reachable : Finset Label :=
    Finset.univ.filter fun z =>
      Relation.ReflTransGen SelectedEdge source z
  have hsource : source ∈ reachable := by
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_univ source, Relation.ReflTransGen.refl⟩
  have hnonempty : reachable.Nonempty := ⟨source, hsource⟩
  have hclosed : rowClosed reachable := by
    intro center hcenter z hz
    have hpath : Relation.ReflTransGen SelectedEdge source center :=
      (Finset.mem_filter.mp hcenter).2
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_univ z, hpath.tail hz⟩
  have hreachable : reachable = Finset.univ :=
    no_nonempty_proper_rowClosed_checked reachable hnonempty hclosed
  have htarget : target ∈ reachable := by
    rw [hreachable]
    exact Finset.mem_univ target
  exact (Finset.mem_filter.mp htarget).2

/-- Despite the full finite surface, the production shared-late-pair
incidence terminal is absent. -/
theorem no_sharedLatePair_checked : ¬ HasSharedLatePair := by
  unfold HasSharedLatePair
  decide

/-- The stronger rotation-invariant shared-pair terminal is also absent. -/
theorem no_cyclicSharedPair_checked : ¬ HasCyclicSharedPair := by
  unfold HasCyclicSharedPair
  decide

/-- The countermodel is deliberately not claimed to be Kalmanson-feasible.
Rows `0,1,2` already provide a three-row equality chain on the quadruple
`0 < 1 < 2 < 6`; this is the generic ordinal-cycle route that remains after
the direct two-row terminal fails. -/
theorem three_row_ordinal_cycle_incidence_checked :
    (1 : Label) ∈ row 0 ∧ (2 : Label) ∈ row 0 ∧
    (2 : Label) ∈ row 1 ∧ (6 : Label) ∈ row 1 ∧
    (1 : Label) ∈ row 2 ∧ (6 : Label) ∈ row 2 := by
  decide

#print axioms finite_surface_checked
#print axioms no_nonempty_proper_rowClosed_checked
#print axioms selectedEdge_reflTransGen
#print axioms no_sharedLatePair_checked
#print axioms no_cyclicSharedPair_checked
#print axioms three_row_ordinal_cycle_incidence_checked

end WholeCarrierSharedLateCountermodel
end Problem97
