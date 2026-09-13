/- Generated Prove2Me solution from Erdos9796Proof.P97.Counting; source commit 0c0bcc832c5070809e6010993f7c4e518523fc31. -/
import Definitions.Def_Erdos9796Counting_Adapter
import Definitions.Def_Erdos9796Counting_Foundation
import Theorems.Thm_Problem97_card_ge_five_of_K4
import Theorems.Thm_Problem97_ConvexIndep_not_collinear_of_card_ge_three

open Problem97

/-!
# Four equidistant witnesses and strict convexity rule out collinearity

Source: `Erdos9796Proof.P97.Counting`, lines 47–52, commit
`0c0bcc832c5070809e6010993f7c4e518523fc31`.
-/

open scoped EuclideanGeometry

theorem solution {A : Finset ℝ²} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A) :
    ¬ Collinear ℝ (A : Set ℝ²) := by
  have h5 : 5 ≤ A.card := card_ge_five_of_K4 hne hK4
  have h3 : 3 ≤ A.card := le_trans (by decide : 3 ≤ 5) h5
  exact ConvexIndep.not_collinear_of_card_ge_three hconv h3
