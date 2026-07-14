import Mathlib

/-!
# ATAIL Stage-I common-cap incidence countermodel

This finite model separates common-cap alignment from the cap-incidence and
selected-row consequences currently available before new geometry is used.
It has the closed-cap `(5,5,5)` arithmetic of a twelve-point cap triple,
ambient cap coverage, a four-point dangerous row at `p`, and a four-point
`u` row whose center belongs to the carrier and whose intersection with every
cap containing the center has cardinality at most two.  Nevertheless `p` and
the `u`-row center share no cap.

The model asserts no Euclidean realization, convexity, MEC minimality,
full-filter exactness, global `K4`, critical deletion system, or no-`M44`
quantification.  It is therefore a kernel-checked dependency countermodel,
not a counterexample to K-A-PAIR.
-/

namespace Problem97
namespace ATAILStageOneCommonCapCountermodel

abbrev Point := Fin 12

def p : Point := 0
def q : Point := 1
def t1 : Point := 2
def t2 : Point := 3
def t3 : Point := 4
def u : Point := 5
def center : Point := 4

def dangerous : Finset Point := {q, t1, t2, t3}
def uSupport : Finset Point := {1, 5, 6, 8}

/- The three Moser vertices are `0,1,2`.  Each closed cap consists of the two
vertices bounding its arc and three strict-interior labels. -/
def cap0 : Finset Point := {1, 2, 3, 4, 5}
def cap1 : Finset Point := {0, 2, 6, 7, 8}
def cap2 : Finset Point := {0, 1, 9, 10, 11}

def capByIndex (k : Fin 3) : Finset Point :=
  if k = 0 then cap0 else if k = 1 then cap1 else cap2

theorem dangerous_card : dangerous.card = 4 := by decide

theorem uSupport_card : uSupport.card = 4 := by decide

theorem p_not_mem_dangerous : p ∉ dangerous := by decide

theorem center_mem_dangerous : center ∈ dangerous := by decide

theorem center_ne_p : center ≠ p := by decide

theorem center_not_mem_uSupport : center ∉ uSupport := by decide

theorem u_mem_uSupport : u ∈ uSupport := by decide

theorem u_not_mem_dangerous : u ∉ dangerous := by decide

theorem cap_card_eq_five (k : Fin 3) : (capByIndex k).card = 5 := by
  fin_cases k <;> decide

theorem closed_cap_sum :
    (capByIndex 0).card + (capByIndex 1).card + (capByIndex 2).card =
      Fintype.card Point + 3 := by decide

theorem cap_pair_inter_card_eq_one
    (i j : Fin 3) (hij : i ≠ j) :
    ((capByIndex i) ∩ (capByIndex j)).card = 1 := by
  fin_cases i <;> fin_cases j <;> simp_all [capByIndex, cap0, cap1, cap2]

theorem ambient_cap_coverage (x : Point) :
    ∃ k : Fin 3, x ∈ capByIndex k := by
  fin_cases x
  all_goals first
    | exact ⟨0, by decide⟩
    | exact ⟨1, by decide⟩
    | exact ⟨2, by decide⟩

theorem p_has_individual_cap : ∃ k : Fin 3, p ∈ capByIndex k :=
  ⟨1, by decide⟩

theorem center_has_individual_cap :
    ∃ k : Fin 3, center ∈ capByIndex k :=
  ⟨0, by decide⟩

theorem no_common_cap :
    ¬ ∃ k : Fin 3, p ∈ capByIndex k ∧ center ∈ capByIndex k := by
  decide

theorem uSupport_inter_dangerous_card_eq_one :
    (uSupport ∩ dangerous).card = 1 := by decide

theorem two_le_uSupport_sdiff_dangerous :
    2 ≤ (uSupport \ dangerous).card := by decide

theorem center_cap_intersection_bound
    (k : Fin 3) (hcenter : center ∈ capByIndex k) :
    (uSupport ∩ capByIndex k).card ≤ 2 := by
  fin_cases k <;> simp_all [capByIndex, cap0, cap1, cap2, center, uSupport]

theorem two_le_uSupport_sdiff_center_cap
    (k : Fin 3) (hcenter : center ∈ capByIndex k) :
    2 ≤ (uSupport \ capByIndex k).card := by
  fin_cases k
  · decide
  · simp_all [capByIndex, cap1, center]
  · simp_all [capByIndex, cap2, center]

/-- All cap/incidence facts used by the present common-cap attempt coexist
with failure of the desired alignment. -/
theorem current_cap_incidence_boundary_is_satisfiable :
    dangerous.card = 4 ∧
    uSupport.card = 4 ∧
    p ∉ dangerous ∧
    center ∈ dangerous ∧
    center ≠ p ∧
    center ∉ uSupport ∧
    u ∈ uSupport ∧
    u ∉ dangerous ∧
    (∀ k : Fin 3, (capByIndex k).card = 5) ∧
    (capByIndex 0).card + (capByIndex 1).card + (capByIndex 2).card =
      Fintype.card Point + 3 ∧
    (∀ i j : Fin 3, i ≠ j →
      ((capByIndex i) ∩ (capByIndex j)).card = 1) ∧
    (∀ x : Point, ∃ k : Fin 3, x ∈ capByIndex k) ∧
    (∃ kp : Fin 3, p ∈ capByIndex kp) ∧
    (∃ kc : Fin 3, center ∈ capByIndex kc) ∧
    (uSupport ∩ dangerous).card = 1 ∧
    (∀ k : Fin 3, center ∈ capByIndex k →
      (uSupport ∩ capByIndex k).card ≤ 2) ∧
    (∀ k : Fin 3, center ∈ capByIndex k →
      2 ≤ (uSupport \ capByIndex k).card) ∧
    2 ≤ (uSupport \ dangerous).card ∧
    ¬ ∃ k : Fin 3, p ∈ capByIndex k ∧ center ∈ capByIndex k := by
  exact ⟨dangerous_card, uSupport_card, p_not_mem_dangerous,
    center_mem_dangerous, center_ne_p, center_not_mem_uSupport,
    u_mem_uSupport, u_not_mem_dangerous, cap_card_eq_five,
    closed_cap_sum, cap_pair_inter_card_eq_one, ambient_cap_coverage,
    p_has_individual_cap, center_has_individual_cap,
    uSupport_inter_dangerous_card_eq_one, center_cap_intersection_bound,
    two_le_uSupport_sdiff_center_cap, two_le_uSupport_sdiff_dangerous,
    no_common_cap⟩

#print axioms cap_pair_inter_card_eq_one
#print axioms no_common_cap
#print axioms current_cap_incidence_boundary_is_satisfiable

end ATAILStageOneCommonCapCountermodel
end Problem97
