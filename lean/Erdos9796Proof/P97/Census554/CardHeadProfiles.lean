/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Mathlib

/-!
# Labeled cap profiles for the optional fixed-head census

Arithmetic exhaustiveness of the labeled card-12--14 profile lists under the
lower bounds on the two large caps and the remaining cap. No geometric census
cut is encoded in this module.
-/

namespace Problem97
namespace Census554

/-- The three labeled profiles at card 12 are exhaustive. -/
theorem labeled_cap_profile_card12_iff (a b c : Nat) :
    5 ≤ a ∧ 5 ≤ b ∧ 4 ≤ c ∧ a + b + c = 15 ↔
      (a = 6 ∧ b = 5 ∧ c = 4) ∨
      (a = 5 ∧ b = 6 ∧ c = 4) ∨
      (a = 5 ∧ b = 5 ∧ c = 5) := by
  omega

/-- The six labeled profiles at card 13 are exhaustive. -/
theorem labeled_cap_profile_card13_iff (a b c : Nat) :
    5 ≤ a ∧ 5 ≤ b ∧ 4 ≤ c ∧ a + b + c = 16 ↔
      (a = 7 ∧ b = 5 ∧ c = 4) ∨
      (a = 6 ∧ b = 6 ∧ c = 4) ∨
      (a = 6 ∧ b = 5 ∧ c = 5) ∨
      (a = 5 ∧ b = 7 ∧ c = 4) ∨
      (a = 5 ∧ b = 6 ∧ c = 5) ∨
      (a = 5 ∧ b = 5 ∧ c = 6) := by
  omega

/-- The ten labeled profiles at card 14 are exhaustive. -/
theorem labeled_cap_profile_card14_iff (a b c : Nat) :
    5 ≤ a ∧ 5 ≤ b ∧ 4 ≤ c ∧ a + b + c = 17 ↔
      (a = 8 ∧ b = 5 ∧ c = 4) ∨
      (a = 7 ∧ b = 6 ∧ c = 4) ∨
      (a = 6 ∧ b = 7 ∧ c = 4) ∨
      (a = 5 ∧ b = 8 ∧ c = 4) ∨
      (a = 7 ∧ b = 5 ∧ c = 5) ∨
      (a = 6 ∧ b = 6 ∧ c = 5) ∨
      (a = 5 ∧ b = 7 ∧ c = 5) ∨
      (a = 6 ∧ b = 5 ∧ c = 6) ∨
      (a = 5 ∧ b = 6 ∧ c = 6) ∨
      (a = 5 ∧ b = 5 ∧ c = 7) := by
  constructor
  · rintro ⟨ha, hb, hc, hsum⟩
    have ha_cases : a = 5 ∨ a = 6 ∨ a = 7 ∨ a = 8 := by omega
    rcases ha_cases with rfl | rfl | rfl | rfl
    all_goals
      have hb_cases : b = 5 ∨ b = 6 ∨ b = 7 ∨ b = 8 := by omega
      rcases hb_cases with rfl | rfl | rfl | rfl <;> omega
  · intro h
    rcases h with h | h | h | h | h | h | h | h | h | h
    all_goals rcases h with ⟨rfl, rfl, rfl⟩
    all_goals omega

end Census554
end Problem97
