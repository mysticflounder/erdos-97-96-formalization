import Definitions.Def_Problem97_IsWitnessSystem
import Solutions.Sol_Problem97_exists_witness_mem_of_card_eq_nine

open scoped EuclideanGeometry
open Erdos9796Mission
open Problem97

namespace NinePointWitnessIncidenceKernelValidation

theorem result {A : Finset Plane} (hne : A.Nonempty)
    (hconv : Problem97.ConvexIndep A) (hK4 : Problem97.HasNEquidistantProperty 4 A)
    (hcard : A.card = 9) {S : Plane → Finset Plane}
    (hS : Problem97.IsWitnessSystem A S) {x : Plane} (hxA : x ∈ A) :
    ∃ y ∈ A, x ∈ S y := by
  exact solution hne hconv hK4 hcard hS hxA

#print axioms result

end NinePointWitnessIncidenceKernelValidation
