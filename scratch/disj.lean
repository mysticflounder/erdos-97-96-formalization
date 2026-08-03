import Mathlib
abbrev U15 := Fin 15
def I0 : Finset U15 := {0,1,2,3}
def I1 : Finset U15 := {4,5,6,7}
def I2 : Finset U15 := {8,9,10,11}
example : Disjoint (I1 : Finset U15) I2 := by
  simp [I1, I2, Finset.disjoint_left]
example : Disjoint (I1 : Finset U15) ({13,14} : Finset U15) := by
  simp [I1, Finset.disjoint_left]
