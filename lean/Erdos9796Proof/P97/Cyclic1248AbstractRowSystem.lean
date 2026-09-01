/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.AbstractRowSystem
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic

/-!
# The cyclic `{1, 2, 4, 8}` row system

This file begins the formalization of the uniform cyclic incidence obstruction.
It is purely combinatorial and makes no claim of Euclidean realizability.
-/

namespace Problem97
namespace Cyclic1248AbstractRowSystem

variable (n : ℕ)

/-- The translate by `c` of the four offsets `1, 2, 4, 8`. -/
def row (c : ZMod n) : Finset (ZMod n) :=
  {c + 1, c + 2, c + 4, c + 8}

/-- The cyclic row family as a weak abstract row system. -/
def system : AbstractRowSystem (ZMod n) where
  row := row n

/-- The chosen predecessor blocker. -/
def beta (q : ZMod n) : ZMod n :=
  q - 1

theorem mem_row_iff (c x : ZMod n) :
    x ∈ row n c ↔ x = c + 1 ∨ x = c + 2 ∨ x = c + 4 ∨ x = c + 8 := by
  simp [row]

/-- Natural numbers below the modulus have distinct images in `ZMod n`. -/
private theorem natCast_ne_of_lt {a b : ℕ}
    (ha : a < n) (hb : b < n) (hab : a ≠ b) :
    (a : ZMod n) ≠ (b : ZMod n) := by
  intro h
  have hmod : a % n = b % n :=
    (ZMod.natCast_eq_natCast_iff' a b n).mp h
  rw [Nat.mod_eq_of_lt ha, Nat.mod_eq_of_lt hb] at hmod
  exact hab hmod

theorem row_card_eq_four (hn : 9 ≤ n) (c : ZMod n) :
    (row n c).card = 4 := by
  have h12 : (1 : ZMod n) ≠ 2 :=
    by simpa using
      natCast_ne_of_lt n (a := 1) (b := 2) (by omega) (by omega) (by omega)
  have h14 : (1 : ZMod n) ≠ 4 :=
    by simpa using
      natCast_ne_of_lt n (a := 1) (b := 4) (by omega) (by omega) (by omega)
  have h18 : (1 : ZMod n) ≠ 8 :=
    by simpa using
      natCast_ne_of_lt n (a := 1) (b := 8) (by omega) (by omega) (by omega)
  have h24 : (2 : ZMod n) ≠ 4 :=
    by simpa using
      natCast_ne_of_lt n (a := 2) (b := 4) (by omega) (by omega) (by omega)
  have h28 : (2 : ZMod n) ≠ 8 :=
    by simpa using
      natCast_ne_of_lt n (a := 2) (b := 8) (by omega) (by omega) (by omega)
  have h48 : (4 : ZMod n) ≠ 8 :=
    by simpa using
      natCast_ne_of_lt n (a := 4) (b := 8) (by omega) (by omega) (by omega)
  simp [row, h12, h14, h18, h24, h28, h48]

theorem system_rowCardEq (hn : 9 ≤ n) :
    (system n).RowCardEq 4 := by
  intro c
  exact row_card_eq_four n hn c

theorem center_not_mem_row (hn : 9 ≤ n) (c : ZMod n) :
    c ∉ row n c := by
  have h10 : (1 : ZMod n) ≠ 0 :=
    by simpa using
      natCast_ne_of_lt n (a := 1) (b := 0) (by omega) (by omega) (by omega)
  have h20 : (2 : ZMod n) ≠ 0 :=
    by simpa using
      natCast_ne_of_lt n (a := 2) (b := 0) (by omega) (by omega) (by omega)
  have h40 : (4 : ZMod n) ≠ 0 :=
    by simpa using
      natCast_ne_of_lt n (a := 4) (b := 0) (by omega) (by omega) (by omega)
  have h80 : (8 : ZMod n) ≠ 0 :=
    by simpa using
      natCast_ne_of_lt n (a := 8) (b := 0) (by omega) (by omega) (by omega)
  simp [row, h10, h20, h40, h80]

theorem system_centerExcluded (hn : 9 ≤ n) :
    (system n).CenterExcluded := by
  intro c
  exact center_not_mem_row n hn c

theorem beta_ne_self (hn : 9 ≤ n) (q : ZMod n) :
    beta n q ≠ q := by
  have h10 : (1 : ZMod n) ≠ 0 :=
    by simpa using
      natCast_ne_of_lt n (a := 1) (b := 0) (by omega) (by omega) (by omega)
  intro h
  apply h10
  have := congrArg (fun x : ZMod n => q - x) h
  simpa [beta] using this

theorem source_mem_beta_row (q : ZMod n) :
    q ∈ row n (beta n q) := by
  simp [row, beta]

theorem system_hasBlockerSection (hn : 9 ≤ n) :
    (system n).HasBlockerSection (beta n) := by
  intro q
  exact ⟨beta_ne_self n hn q, source_mem_beta_row n q⟩

theorem beta_bijective : Function.Bijective (beta n) := by
  constructor
  · intro a b h
    have := congrArg (fun x : ZMod n => x + 1) h
    simpa [beta] using this
  · intro q
    refine ⟨q + 1, ?_⟩
    simp [beta]

/-- The `+1` edge forces every nonempty support-closed set to contain the
whole cyclic carrier. -/
theorem system_supportMinimal [NeZero n] :
    (system n).SupportMinimal := by
  intro T hT hclosed
  apply Finset.eq_univ_of_forall
  intro x
  rcases hT with ⟨c, hc⟩
  have hstep (y : ZMod n) (hy : y ∈ T) : y + 1 ∈ T := by
    apply hclosed hy
    simp [system, row]
  have hiter : ∀ k : ℕ, c + (k : ZMod n) ∈ T := by
    intro k
    induction k with
    | zero => simpa using hc
    | succ k ih =>
        have hnext := hstep (c + (k : ZMod n)) ih
        simpa [Nat.cast_succ, add_assoc] using hnext
  have hx := hiter (x - c).val
  simpa [ZMod.natCast_zmod_val] using hx

end Cyclic1248AbstractRowSystem
end Problem97
