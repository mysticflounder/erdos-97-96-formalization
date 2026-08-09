import Mathlib.Data.Fin.Basic

/-!
Synthetic bridge smoke only.  PIQD does not yet export Lean source to
`LeanSatIr`, so the neighboring JSON is a hand-authored rendering of this
statement rather than an authenticated translation.
-/

theorem p97PiqdOrderOneCommutativityCanary (mul : Fin 1 → Fin 1 → Fin 1) :
    ∀ x y, mul x y = mul y x := by
  intro x y
  exact Subsingleton.elim _ _
