import Erdos9796Proof.P97.ConvexIndepHelpers

/-!
# Descent glue: removable vertex ⇒ smaller counterexample (Milestone 2)

This file packages the trivial half of the descent: given a removable
vertex of a counterexample, erasing it produces a strictly smaller
counterexample.  The hard half — actually *finding* a removable vertex
in any counterexample with `|A| > 9` — is the Milestone 4 surplus-cap
analysis (`p97-removable-vertex-of-large` and its U1–U7 refinement),
still open.

`smaller_counterexample_of_removable` is the input shape that the M1
universal-descent assembly consumes via
`UniversalReductionHypotheses.descent`.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- A vertex `x ∈ A` is *removable* for the 4-equidistant property if
erasing `x` preserves that property on the remaining vertices.  Output
type of the M4 surplus-cap analysis; input of the M2 descent glue. -/
def IsRemovableVertex (A : Finset ℝ²) (x : ℝ²) : Prop :=
  x ∈ A ∧ HasNEquidistantProperty 4 (A.erase x)

/-- **Descent glue.**  A removable vertex of a counterexample produces a
strictly smaller counterexample. -/
theorem smaller_counterexample_of_removable
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    {x : ℝ²} (hrem : IsRemovableVertex A x) (hcard : 1 < A.card) :
    ∃ B : Finset ℝ², B.Nonempty ∧ B.card < A.card ∧
        ConvexIndep B ∧ HasNEquidistantProperty 4 B := by
  refine ⟨A.erase x, ?_, ?_, ConvexIndep.erase x hconv, hrem.2⟩
  · rw [← Finset.card_pos, Finset.card_erase_of_mem hrem.1]
    omega
  · exact Finset.card_erase_lt_of_mem hrem.1

end Problem97
