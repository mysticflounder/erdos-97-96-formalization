import Mathlib

/-!
# Finite regression gate for the unaligned-row reduction

This dependency model records only the finite consequences used before the
new cap/order producer:

* two four-point rows with overlap at most two;
* two first-row points outside the live row;
* three five-point closed caps with the usual pairwise one-point overlaps;
* ambient cap coverage; and
* individual cap coverage of the two row centers.

Those facts coexist with failure of common-cap alignment.  The model is not a
Euclidean `CounterexampleData` and does not model MEC minimality, convexity,
global K4, exact radius filters, or a critical-shell system.  It prevents the
uniform row-count reduction from being mistaken for a proof of the missing
common-cap field.
-/

namespace Problem97
namespace ATailRUnalignedHandlerRegression

abbrev Point := Fin 12

def liveCenter : Point := 0
def firstCenter : Point := 4

def liveRow : Finset Point := {1, 2, 3, 4}
def firstRow : Finset Point := {1, 5, 6, 8}

def cap0 : Finset Point := {1, 2, 3, 4, 5}
def cap1 : Finset Point := {0, 2, 6, 7, 8}
def cap2 : Finset Point := {0, 1, 9, 10, 11}

def capByIndex (k : Fin 3) : Finset Point :=
  if k = 0 then cap0 else if k = 1 then cap1 else cap2

theorem liveRow_card : liveRow.card = 4 := by decide

theorem firstRow_card : firstRow.card = 4 := by decide

theorem row_inter_card_le_two :
    (firstRow ∩ liveRow).card ≤ 2 := by decide

theorem two_firstRow_points_off_live :
    2 ≤ (firstRow \ liveRow).card := by decide

theorem cap_card_eq_five (k : Fin 3) :
    (capByIndex k).card = 5 := by
  fin_cases k <;> decide

theorem cap_pair_inter_card_eq_one
    (i j : Fin 3) (hij : i ≠ j) :
    ((capByIndex i) ∩ (capByIndex j)).card = 1 := by
  fin_cases i <;> fin_cases j <;>
    simp_all [capByIndex, cap0, cap1, cap2]

theorem ambient_cap_coverage (x : Point) :
    ∃ k : Fin 3, x ∈ capByIndex k := by
  fin_cases x
  all_goals first
    | exact ⟨0, by decide⟩
    | exact ⟨1, by decide⟩
    | exact ⟨2, by decide⟩

theorem liveCenter_has_cap :
    ∃ k : Fin 3, liveCenter ∈ capByIndex k :=
  ⟨1, by decide⟩

theorem firstCenter_has_cap :
    ∃ k : Fin 3, firstCenter ∈ capByIndex k :=
  ⟨0, by decide⟩

theorem no_common_center_cap :
    ¬ ∃ k : Fin 3,
      liveCenter ∈ capByIndex k ∧ firstCenter ∈ capByIndex k := by
  decide

/-- The entire pre-producer finite surface is satisfiable while common-cap
alignment fails. -/
theorem preproducer_surface_is_satisfiable :
    liveCenter ≠ firstCenter ∧
    liveRow.card = 4 ∧
    firstRow.card = 4 ∧
    (firstRow ∩ liveRow).card ≤ 2 ∧
    2 ≤ (firstRow \ liveRow).card ∧
    (∀ k : Fin 3, (capByIndex k).card = 5) ∧
    (∀ i j : Fin 3, i ≠ j →
      ((capByIndex i) ∩ (capByIndex j)).card = 1) ∧
    (∀ x : Point, ∃ k : Fin 3, x ∈ capByIndex k) ∧
    (∃ k : Fin 3, liveCenter ∈ capByIndex k) ∧
    (∃ k : Fin 3, firstCenter ∈ capByIndex k) ∧
    ¬ ∃ k : Fin 3,
      liveCenter ∈ capByIndex k ∧ firstCenter ∈ capByIndex k := by
  exact ⟨by decide, liveRow_card, firstRow_card,
    row_inter_card_le_two, two_firstRow_points_off_live,
    cap_card_eq_five, cap_pair_inter_card_eq_one,
    ambient_cap_coverage, liveCenter_has_cap, firstCenter_has_cap,
    no_common_center_cap⟩

#print axioms no_common_center_cap
#print axioms preproducer_surface_is_satisfiable

end ATailRUnalignedHandlerRegression
end Problem97
