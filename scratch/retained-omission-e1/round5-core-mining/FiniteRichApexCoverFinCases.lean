import Mathlib
namespace Problem97FinCases
set_option maxRecDepth 100000
abbrev U15 := Fin 15
def U : Finset U15 := Finset.univ
def I0 : Finset U15 := {0, 1, 2, 3}
def I1 : Finset U15 := {4, 5, 6, 7}
def I2 : Finset U15 := {8, 9, 10, 11}
def richOptions (interior : Finset U15) (apex : U15) : Finset (Finset U15) :=
  (U.powerset.filter (fun extra => extra.card = 2 ∧ Disjoint extra (interior ∪ {apex}))).image
    (fun extra => interior ∪ extra)
abbrev R0 := (richOptions I0 12).attach
abbrev R1 := (richOptions I1 13).attach
abbrev R2 := (richOptions I2 14).attach
def atMostOne (X Y D : Finset U15) : Prop := (X ∩ Y ∩ D).card ≤ 1
def richPairCuts (r0 : R0) (r1 : R1) (r2 : R2) : Prop :=
  atMostOne r0.1 r1.1 {0,1,2,3,4,5,6,7,14} ∧
  atMostOne r0.1 r2.1 {0,1,2,3,8,9,10,11,13} ∧
  atMostOne r1.1 r2.1 {4,5,6,7,8,9,10,11,12}
instance richPairCutsDecidable (r0 : R0) (r1 : R1) (r2 : R2) : Decidable (richPairCuts r0 r1 r2) := by
  unfold richPairCuts at *; unfold atMostOne at *; infer_instance
theorem test (r0 : R0) (r1 : R1) (r2 : R2) (h : richPairCuts r0 r1 r2) :
    (12 : U15) ∈ r1.1 ∪ r2.1 := by
  fin_cases r0 <;> fin_cases r1 <;> fin_cases r2 <;> simp_all [richPairCuts, atMostOne, richOptions, U, I0, I1, I2]
end Problem97FinCases
