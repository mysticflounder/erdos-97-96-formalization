import Definitions.Def_Erdos9796Mission_RemovableVertex

open Erdos9796Mission

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.smaller_counterexample_of_removable
    {A : Finset Plane} (hconv : ConvexIndep (A : Set Plane))
    {x : Plane} (hrem : IsRemovableVertex A x) (hcard : 1 < A.card) :
    ∃ B : Finset Plane, B.Nonempty ∧ B.card < A.card ∧
      ConvexIndep (B : Set Plane) ∧ HasNEquidistantProperty 4 B := by sorry
