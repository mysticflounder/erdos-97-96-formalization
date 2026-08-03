import Mathlib
namespace C
abbrev U15 := Fin 15
def I0 : Finset U15 := {0,1,2,3}
def I1 : Finset U15 := {4,5,6,7}
def I2 : Finset U15 := {8,9,10,11}
example (e : Finset U15) (hd : Disjoint e (I0 ∪ ({12} : Finset U15))) :
    e ⊆ I1 ∪ I2 ∪ ({13,14} : Finset U15) := by
  intro x hx
  have hxn : x ∉ I0 ∪ ({12} : Finset U15) := by
    intro h
    exact (Finset.disjoint_left.mp hd) hx h
  fin_cases x <;> simp_all [I0, I1, I2]
end C
