import Definitions.Def_Problem97_IsWitnessSystem
import Definitions.Def_Erdos9796Counting_Adapter
import Definitions.Def_Erdos9796Counting_Foundation
import Theorems.Thm_Problem97_card_ge_five_of_K4
import Solutions.Sol_Problem97_K4_delete_of_indeg_zero

open scoped EuclideanGeometry
open Erdos9796Mission

namespace WitnessDeletionKernelValidation

theorem result {A : Finset Plane} (hne : A.Nonempty)
    (hconv : ConvexIndep (A : Set Plane))
    (hK4 : HasNEquidistantProperty 4 A)
    {S : Plane → Finset Plane} (hS : Problem97.IsWitnessSystem A S)
    {x : Plane} (hxA : x ∈ A) (hindeg0 : ∀ y ∈ A, x ∉ S y) :
    (A.erase x).Nonempty ∧
      ConvexIndep ((A.erase x : Finset Plane) : Set Plane) ∧
      HasNEquidistantProperty 4 (A.erase x) := by
  exact solution hne hconv hK4 hS hxA hindeg0

#print axioms result

end WitnessDeletionKernelValidation
