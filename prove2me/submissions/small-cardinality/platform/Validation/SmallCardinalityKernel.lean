import Theorems.Thm_Erdos9796Mission_counterexample_card_ge_nine
import Theorems.Thm_Erdos9796Mission_finite_nine_exclusion

/-! Validate the two new deductions against the exact accepted platform statements. -/

open Erdos9796Mission

namespace SmallCardinalityValidation

theorem counterexample_card_ge_ten :
    ∀ A : Finset Plane, A.Nonempty → ConvexIndep (A : Set Plane) →
      HasNEquidistantProperty 4 A → 10 ≤ A.card := by
  intro A hne hconv hK4
  have hge : 9 ≤ A.card := Erdos9796Mission.counterexample_card_ge_nine A hne hconv hK4
  have hneNine : A.card ≠ 9 := by
    intro hcard
    exact Erdos9796Mission.finite_nine_exclusion A hcard hconv hK4
  omega

theorem not_hasNEquidistantProperty_four_of_card_le_nine :
    ∀ A : Finset Plane, A.Nonempty → ConvexIndep (A : Set Plane) →
      A.card ≤ 9 → ¬ HasNEquidistantProperty 4 A := by
  intro A hne hconv hcard hK4
  have hten : 10 ≤ A.card := counterexample_card_ge_ten A hne hconv hK4
  omega

end SmallCardinalityValidation
