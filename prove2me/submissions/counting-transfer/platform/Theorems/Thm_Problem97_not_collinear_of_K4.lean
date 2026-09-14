/- Generated theorem stub from Erdos9796Proof.P97.Counting; source commit 0c0bcc832c5070809e6010993f7c4e518523fc31. -/
import Definitions.Def_Erdos9796Counting_Adapter
import Definitions.Def_Erdos9796Counting_Foundation
import Theorems.Thm_Problem97_card_ge_five_of_K4
import Theorems.Thm_Problem97_ConvexIndep_not_collinear_of_card_ge_three

open Problem97

/-!
# Four equidistant witnesses and strict convexity rule out collinearity

`Problem97.not_collinear_of_K4` packages the lower bound of five points with
the strict-convexity obstruction for sets of cardinality at least three.

Source: `Erdos9796Proof.P97.Counting`, lines 47–52, commit
`0c0bcc832c5070809e6010993f7c4e518523fc31`.
-/

open scoped EuclideanGeometry

-- PROVE2ME_FORMAL_STATEMENT
theorem Problem97.not_collinear_of_K4 {A : Finset ℝ²} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A) :
    ¬ Collinear ℝ (A : Set ℝ²) := by sorry
