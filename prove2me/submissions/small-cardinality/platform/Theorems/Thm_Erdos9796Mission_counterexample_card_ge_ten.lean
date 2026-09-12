import Theorems.Thm_Erdos9796Mission_counterexample_card_ge_nine
import Theorems.Thm_Erdos9796Mission_finite_nine_exclusion

open Erdos9796Mission

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.counterexample_card_ge_ten :
    ∀ A : Finset Plane, A.Nonempty → ConvexIndep (A : Set Plane) →
      HasNEquidistantProperty 4 A → 10 ≤ A.card := by sorry
