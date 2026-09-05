/- Statement-only mission draft: SKETCH — NOT PROMOTABLE.
Source and precise status are recorded in items.json. -/
import Definitions.Def_Erdos9796Mission
open Erdos9796Mission

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.linear_bound_of_problem97 :
    Problem97 → (∀ A : Finset Plane, ConvexIndep (A : Set Plane) → unitDistancePairsCount A ≤ 3 * A.card) ∧ Problem96 := by sorry
