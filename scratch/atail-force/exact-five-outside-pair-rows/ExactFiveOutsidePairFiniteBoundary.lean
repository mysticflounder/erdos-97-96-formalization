import Mathlib

/-!
# Exact-five outside-pair row boundary

This is a finite incidence/order abstraction, not a Euclidean realization.
It retains the exact-five physical cap, an asymmetric two-hit hub row, the
two-edge carrier-wide deletion cover, total deletion-critical rows, strong
selected-row connectivity, the two-circle overlap bound, ordered-cap hit
bounds, outside-pair uniqueness at cap centers, and abstract five-point
robust classes at both apices. Nevertheless the actual rows at the named
outside pair omit one another and no second recorded row contains the pair.
-/

namespace Problem97.ExactFiveOutsidePairFiniteBoundary

abbrev Label := Fin 10

def hub : Label := 0
def spoke₁ : Label := 1
def spoke₂ : Label := 2
def outside₁ : Label := 3
def outside₂ : Label := 4
def secondApex : Label := 5
def firstApex : Label := 6
def leftEndpoint : Label := 7
def rightEndpoint : Label := 8

def physicalVertices : Finset Label := {hub, spoke₁, spoke₂}
def physicalInterior : Finset Label := {spoke₁, hub, spoke₂}
def physicalCap : Finset Label :=
  {leftEndpoint, spoke₁, hub, spoke₂, rightEndpoint}

def boundary : Fin 10 → Label := ![7, 1, 0, 2, 8, 4, 6, 9, 5, 3]

def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 5, 8, 9},
    {0, 4, 5, 7},
    {1, 4, 5, 9},
    {5, 6, 7, 9},
    {1, 2, 7, 9},
    {2, 3, 5, 8},
    {0, 4, 6, 9},
    {0, 3, 5, 6},
    {2, 4, 6, 7}]

def blocker : Label → Label := ![7, 0, 9, 8, 2, 3, 4, 5, 6, 1]

def criticalSupport (source : Label) : Finset Label := globalRow (blocker source)

def secondApexClass : Finset Label := {0, 1, 2, 7, 9}
def firstApexClass : Finset Label := {0, 1, 2, 3, 7}

def connectivityCycle : Fin 10 → Label := ![0, 1, 5, 2, 4, 6, 8, 3, 9, 7]

def nextCycleIndex (i : Fin 10) : Fin 10 := ⟨(i + 1) % 10, by omega⟩

theorem row_geometry_shadow_checked :
    (∀ c : Label, (globalRow c).card = 4) ∧
    (∀ c : Label, c ∉ globalRow c) ∧
    (∀ c d : Label, c ≠ d →
      ((globalRow c) ∩ (globalRow d)).card ≤ 2) := by
  decide

theorem total_critical_system_checked :
    Function.Bijective blocker ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, ((criticalSupport source).erase source).card = 3) ∧
    (∀ x y : Label, blocker x = blocker y →
      criticalSupport x = criticalSupport y) := by
  decide

theorem selected_row_digraph_hamiltonian_cycle_checked :
    Function.Bijective connectivityCycle ∧
    (∀ i : Fin 10,
      connectivityCycle (nextCycleIndex i) ∈ globalRow (connectivityCycle i)) := by
  decide

theorem exact_five_cap_and_order_checked :
    physicalCap.card = 5 ∧
    physicalVertices.card = 3 ∧
    Finset.univ.image boundary = Finset.univ ∧
    boundary 0 = leftEndpoint ∧
    boundary 1 = spoke₁ ∧
    boundary 2 = hub ∧
    boundary 3 = spoke₂ ∧
    boundary 4 = rightEndpoint ∧
    physicalVertices = secondApexClass ∩ physicalInterior := by
  decide

theorem cap_row_bounds_and_pair_uniqueness_checked :
    ((globalRow leftEndpoint) ∩ physicalCap).card ≤ 1 ∧
    ((globalRow rightEndpoint) ∩ physicalCap).card ≤ 1 ∧
    (∀ c ∈ physicalVertices,
      ((globalRow c) ∩ physicalCap).card ≤ 2) ∧
    (∀ c ∈ physicalCap, ∀ d ∈ physicalCap, c ≠ d →
      (((globalRow c \ physicalCap) ∩
        (globalRow d \ physicalCap)).card ≤ 1)) := by
  decide

theorem exact_five_apex_class_and_robustness_checked :
    secondApex ∉ secondApexClass ∧
    secondApexClass.card = 5 ∧
    globalRow secondApex ⊆ secondApexClass ∧
    (∀ deleted : Label, 4 ≤ (secondApexClass.erase deleted).card) ∧
    firstApex ∉ firstApexClass ∧
    firstApexClass.card = 5 ∧
    (∀ deleted : Label, 4 ≤ (firstApexClass.erase deleted).card) ∧
    ¬ (outside₁ ∈ firstApexClass ∧ outside₂ ∈ firstApexClass) := by
  decide

theorem asymmetric_star_surface_checked :
    globalRow hub = {spoke₁, spoke₂, outside₁, outside₂} ∧
    (criticalSupport hub ∩ physicalVertices) = {hub} ∧
    (criticalSupport spoke₁ ∩ physicalVertices) = {spoke₁, spoke₂} ∧
    (∀ center : Label,
      ¬ (hub ∈ globalRow center ∧ spoke₁ ∈ globalRow center)) ∧
    (∀ center : Label,
      ¬ (hub ∈ globalRow center ∧ spoke₂ ∈ globalRow center)) := by
  decide

theorem outside_actual_rows_avoid_every_terminal_pair_input :
    outside₂ ∉ criticalSupport outside₁ ∧
    outside₁ ∉ criticalSupport outside₂ ∧
    blocker outside₁ ∈ physicalCap ∧
    blocker outside₂ ∈ physicalCap ∧
    ¬ ∃ center : Label, center ≠ hub ∧
      outside₁ ∈ globalRow center ∧ outside₂ ∈ globalRow center := by
  decide

#print axioms row_geometry_shadow_checked
#print axioms total_critical_system_checked
#print axioms selected_row_digraph_hamiltonian_cycle_checked
#print axioms exact_five_cap_and_order_checked
#print axioms cap_row_bounds_and_pair_uniqueness_checked
#print axioms exact_five_apex_class_and_robustness_checked
#print axioms asymmetric_star_surface_checked
#print axioms outside_actual_rows_avoid_every_terminal_pair_input

end Problem97.ExactFiveOutsidePairFiniteBoundary
