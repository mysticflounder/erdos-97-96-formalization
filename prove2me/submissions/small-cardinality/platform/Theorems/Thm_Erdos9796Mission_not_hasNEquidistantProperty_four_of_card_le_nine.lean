import Theorems.Thm_Erdos9796Mission_counterexample_card_ge_nine
import Theorems.Thm_Erdos9796Mission_finite_nine_exclusion

open Erdos9796Mission

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.not_hasNEquidistantProperty_four_of_card_le_nine :
    ∀ A : Finset Plane, A.Nonempty → ConvexIndep (A : Set Plane) →
      A.card ≤ 9 → ¬ HasNEquidistantProperty 4 A := by sorry
