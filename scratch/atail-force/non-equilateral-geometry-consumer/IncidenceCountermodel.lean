/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite incidence shadow for the non-equilateral terminal

This is a kernel-checked finite incidence model, not a Euclidean
`CounterexampleData`.  It retains a five-five-five closed-cap profile, one
four-row at every center, the two native mutual continuation rows, and a
total source-to-critical-center map.  The exclusive strict-cap witnesses are
deletion-critical at their respective native row centers, yet the globally
available rows centered at those witnesses contain neither continuation
center.

Consequently, all-center row existence and prescribed deletion-criticality
do not imply the reverse incidences needed by the five-point metric bank.
Any proof of those incidences must use additional Euclidean/MEC geometry,
not only the finite row and critical-map interface represented here.
-/

namespace Problem97
namespace ATailNonEquilateralGeometryConsumerScratch
namespace IncidenceCountermodel

abbrev Label := Fin 12

def surplusCap : Finset Label := {0, 2, 6, 7, 8}
def oppositeCap1 : Finset Label := {0, 1, 9, 10, 11}
def oppositeCap2 : Finset Label := {1, 2, 3, 4, 5}
def strictOppositeCap1 : Finset Label :=
  oppositeCap1 \ (surplusCap ∪ oppositeCap2)

def apex : Label := 0
def z₁ : Label := 3
def z₂ : Label := 4
def strictWitness₁ : Label := 11
def strictWitness₂ : Label := 10

/-- A four-point support at every center. -/
def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 2, 6, 7},
    {0, 1, 9, 10},
    {1, 4, 7, 11},
    {3, 5, 6, 10},
    {0, 3, 8, 11},
    {2, 7, 8, 10},
    {4, 6, 9, 11},
    {3, 5, 7, 9},
    {0, 4, 5, 10},
    {2, 5, 8, 11},
    {1, 6, 8, 9}]

/-- A total critical-center choice.  In particular sources `11` and `10`
choose the two native continuation centers `3` and `4`. -/
def blocker : Label → Label :=
  ![1, 0, 0, 0, 0, 4, 7, 6, 5, 2, 4, 3]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

/-- Exact five-five-five cap profile, hence a genuine second large cap and
failure of the `(m,4,4)` profile. -/
theorem cap_profile_checked :
    surplusCap.card = 5 ∧
      oppositeCap1.card = 5 ∧
      oppositeCap2.card = 5 ∧
      surplusCap ∪ oppositeCap1 ∪ oppositeCap2 = Finset.univ ∧
      surplusCap ∩ oppositeCap1 = {0} ∧
      surplusCap ∩ oppositeCap2 = {2} ∧
      oppositeCap1 ∩ oppositeCap2 = {1} ∧
      strictOppositeCap1 = {9, 10, 11} := by
  decide

/-- All-center four-row existence, center omission, and the generic
two-circle support-intersection bound hold in the shadow. -/
theorem all_center_rows_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
      (∀ center : Label, center ∉ globalRow center) ∧
      (∀ c₁ c₂ : Label, c₁ ≠ c₂ →
        ((globalRow c₁) ∩ (globalRow c₂)).card ≤ 2) := by
  decide

/-- The total critical map has the finite exact-shell consequences: every
source lies on its blocker row, blockers are nonfixed, common blockers lock
the support, and deleting the source leaves three of the four shell points. -/
theorem critical_map_checked :
    (∀ source : Label, source ∈ criticalSupport source) ∧
      (∀ source : Label, blocker source ≠ source) ∧
      (∀ x y : Label, blocker x = blocker y →
        criticalSupport x = criticalSupport y) ∧
      (∀ source : Label,
        ((criticalSupport source).erase source).card = 3) := by
  decide

/-- Exact incidence form of the two-by-two non-equilateral terminal. -/
theorem native_two_by_two_terminal_checked :
    z₁ ≠ z₂ ∧
      z₁ ∈ oppositeCap2 ∧ z₂ ∈ oppositeCap2 ∧
      z₁ ∈ globalRow apex ∧ z₂ ∈ globalRow apex ∧
      z₂ ∈ globalRow z₁ ∧ z₁ ∈ globalRow z₂ ∧
      apex ∉ globalRow z₁ ∧ apex ∉ globalRow z₂ ∧
      (globalRow z₁ ∩ globalRow z₂).card = 0 ∧
      (globalRow z₁ \ oppositeCap2).card = 2 ∧
      (globalRow z₁ ∩ oppositeCap2).card = 2 ∧
      (globalRow z₂ \ oppositeCap2).card = 2 ∧
      (globalRow z₂ ∩ oppositeCap2).card = 2 := by
  decide

/-- The support dichotomy lands in the exclusive strict-witness arm, not a
surplus-heavy arm. -/
theorem exclusive_strict_witnesses_checked :
    (globalRow z₁ ∩ surplusCap).card = 1 ∧
      (globalRow z₂ ∩ surplusCap).card = 1 ∧
      strictWitness₁ ∈ globalRow z₁ ∧
      strictWitness₁ ∉ globalRow z₂ ∧
      strictWitness₁ ∈ strictOppositeCap1 ∧
      strictWitness₂ ∈ globalRow z₂ ∧
      strictWitness₂ ∉ globalRow z₁ ∧
      strictWitness₂ ∈ strictOppositeCap1 ∧
      strictWitness₁ ≠ strictWitness₂ := by
  decide

/-- The native union has six sources outside the apex's chosen critical
support, strengthening the required lower bound four. -/
theorem six_native_sources_outside_apex_critical_support :
    ((globalRow z₁ ∪ globalRow z₂) \ criticalSupport apex).card = 6 := by
  decide

/-- Both strict witnesses are prescribed-deletion-critical at the native
row center on whose row they lie. -/
theorem strict_witnesses_use_native_blockers :
    blocker strictWitness₁ = z₁ ∧
      blocker strictWitness₂ = z₂ ∧
      criticalSupport strictWitness₁ = globalRow z₁ ∧
      criticalSupport strictWitness₂ = globalRow z₂ := by
  decide

/-- Nevertheless, the globally supplied rows centered at the strict
witnesses have none of the four reverse incidences to the continuation pair.
This is the first missing antecedent for a reciprocal-grid or five-point-bank
consumer. -/
theorem reverse_selected_row_incidences_fail :
    z₁ ∉ globalRow strictWitness₁ ∧
      z₂ ∉ globalRow strictWitness₁ ∧
      z₁ ∉ globalRow strictWitness₂ ∧
      z₂ ∉ globalRow strictWitness₂ := by
  decide

/-- Incidence shadow of the seven equalities in `u1TwoLargeCapObstruction`
when its two primary centers are the native continuation centers. -/
def FivePointBankIncidence (a c d e f : Label) : Prop :=
  a ∈ globalRow c ∧ d ∈ globalRow c ∧ f ∈ globalRow c ∧
    c ∈ globalRow d ∧ e ∈ globalRow d ∧ f ∈ globalRow d ∧
    a ∈ globalRow f ∧ d ∈ globalRow f ∧ e ∈ globalRow f ∧
    a ∈ globalRow e ∧ c ∈ globalRow e

/-- The native rows do not even produce the common point `f` required by
the five-point metric bank, so its exact seven-equality consumer cannot be
instantiated from this interface alone. -/
theorem no_fivePointBankIncidence_at_native_centers :
    ¬ ∃ a e f : Label, FivePointBankIncidence a z₁ z₂ e f := by
  rintro ⟨a, e, f, h⟩
  rcases h with
    ⟨_ha, _hd, hfc, _hc, _he, hfd, _haf, _hdf, _hef, _hae, _hce⟩
  have hf : f ∈ globalRow z₁ ∩ globalRow z₂ :=
    Finset.mem_inter.mpr ⟨hfc, hfd⟩
  simp [globalRow, z₁, z₂] at hf

#print axioms cap_profile_checked
#print axioms all_center_rows_checked
#print axioms critical_map_checked
#print axioms native_two_by_two_terminal_checked
#print axioms exclusive_strict_witnesses_checked
#print axioms reverse_selected_row_incidences_fail
#print axioms no_fivePointBankIncidence_at_native_centers

end IncidenceCountermodel
end ATailNonEquilateralGeometryConsumerScratch
end Problem97
