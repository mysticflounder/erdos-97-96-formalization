import Definitions.Def_Erdos9796Mission

/-! The removable-vertex interface used by the Problem 97 descent. -/

open Erdos9796Mission

namespace Erdos9796Mission

/-- A point of `A` is removable when deleting it preserves the property that
every remaining point has four equidistant witnesses. -/
def IsRemovableVertex (A : Finset Plane) (x : Plane) : Prop :=
  x ∈ A ∧ HasNEquidistantProperty 4 (A.erase x)

end Erdos9796Mission
