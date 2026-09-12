import Definitions.Def_Erdos9796Mission_RemovableVertex

/-! Kernel validation of the removable-vertex descent glue. -/

open Erdos9796Mission
open Finset

namespace RemovableVertexGlueKernelValidation

lemma convexIndep_erase {A : Finset Plane} (hconv : ConvexIndep (A : Set Plane))
    (x : Plane) : ConvexIndep (A.erase x : Set Plane) := by
  intro a ha hm
  exact hconv a (erase_subset x A ha)
    (convexHull_mono (Set.sdiff_subset_sdiff_left
      (coe_subset.mpr (erase_subset x A))) hm)

theorem smaller_counterexample_of_removable
    {A : Finset Plane} (hconv : ConvexIndep (A : Set Plane))
    {x : Plane} (hrem : IsRemovableVertex A x) (hcard : 1 < A.card) :
    ∃ B : Finset Plane, B.Nonempty ∧ B.card < A.card ∧
      ConvexIndep (B : Set Plane) ∧ HasNEquidistantProperty 4 B := by
  refine ⟨A.erase x, ?_, ?_, convexIndep_erase hconv x, hrem.2⟩
  · rw [← Finset.card_pos, Finset.card_erase_of_mem hrem.1]
    omega
  · exact Finset.card_erase_lt_of_mem hrem.1

#print axioms smaller_counterexample_of_removable

end RemovableVertexGlueKernelValidation
