/- Rehosted from Erdos9796Proof.P97.K4WitnessDeletion at source commit
   387e5b44ae26906725a4898b0a01c2d7345ddb38. -/
import Definitions.Def_Problem97_IsWitnessSystem
import Definitions.Def_Erdos9796Counting_Adapter
import Definitions.Def_Erdos9796Counting_Foundation

open scoped EuclideanGeometry
open Finset

open Problem97

-- PROVE2ME_FORMAL_STATEMENT
theorem Problem97.K4_delete_of_indeg_zero {A : Finset ℝ²} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    {S : ℝ² → Finset ℝ²} (hS : IsWitnessSystem A S)
    {x : ℝ²} (hxA : x ∈ A) (hindeg0 : ∀ y ∈ A, x ∉ S y) :
    (A.erase x).Nonempty ∧ ConvexIndep (A.erase x) ∧
      HasNEquidistantProperty 4 (A.erase x) := by sorry
