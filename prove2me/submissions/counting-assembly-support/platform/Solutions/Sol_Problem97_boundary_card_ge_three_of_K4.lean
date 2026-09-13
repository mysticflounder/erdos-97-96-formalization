/- Generated Prove2Me solution from Erdos9796Proof.P97.Counting; source commit 0c0bcc832c5070809e6010993f7c4e518523fc31. -/
import Definitions.Def_Erdos9796Counting_Adapter
import Definitions.Def_Erdos9796Counting_Foundation
import Definitions.Def_Erdos9796Counting_MEC_Basic
import Theorems.Thm_Problem97_not_collinear_of_K4
import Theorems.Thm_Problem97_MEC_no_diameter_under_k4

open Problem97

/-!
# The minimum enclosing circle has at least three boundary points

Source: `Erdos9796Proof.P97.Counting`, lines 57–63, commit
`0c0bcc832c5070809e6010993f7c4e518523fc31`.
-/

open scoped EuclideanGeometry

theorem solution {A : Finset ℝ²} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A) :
    3 ≤ (A.filter (fun p =>
      dist p (Problem97.MEC.mec A hne).center = (Problem97.MEC.mec A hne).radius)).card := by
  have hnoncol : ¬ Collinear ℝ (A : Set ℝ²) :=
    not_collinear_of_K4 hne hconv hK4
  exact Problem97.MEC.no_diameter_under_k4 hne hnoncol hconv hK4
