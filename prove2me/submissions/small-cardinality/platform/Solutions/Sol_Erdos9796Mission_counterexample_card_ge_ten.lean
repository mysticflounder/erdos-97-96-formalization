import Theorems.Thm_Erdos9796Mission_counterexample_card_ge_nine
import Theorems.Thm_Erdos9796Mission_finite_nine_exclusion

open Erdos9796Mission

theorem solution :
    ∀ A : Finset Plane, A.Nonempty → ConvexIndep (A : Set Plane) →
      HasNEquidistantProperty 4 A → 10 ≤ A.card := by
  intro A hne hconv hK4
  have hge : 9 ≤ A.card := counterexample_card_ge_nine A hne hconv hK4
  have hneNine : A.card ≠ 9 := by
    intro hcard
    exact finite_nine_exclusion A hcard hconv hK4
  omega
