import Mathlib
abbrev U15 := Fin 15
example (e f : Finset U15) :
    (e ∩ ({14} : Finset U15)).card + (f ∩ ({14} : Finset U15)).card ≤
      1 + (e ∩ f ∩ ({14} : Finset U15)).card := by
  by_cases he : (14:U15) ∈ e <;> by_cases hf : (14:U15) ∈ f <;>
    simp [he, hf]
