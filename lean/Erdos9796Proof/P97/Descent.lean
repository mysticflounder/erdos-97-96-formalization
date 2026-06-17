import Erdos9796Proof.P97.RemovableVertexAxiom

/-!
# Descent assembly (Milestone 4 packaged for M1 consumption)

Composes `RemovableVertexOfLarge` (axiomatized M4 surplus-cap output)
with `smaller_counterexample_of_removable` (proven M2 glue) into the
exact descent shape consumed by
`UniversalReductionHypotheses.descent`.

Since `RemovableVertexOfLarge` now carries the strong-induction
minimality IH ("no strictly-smaller K4 counterexample exists"),
the natural composition yields a contradiction directly rather than a
"find smaller B" existential — the smaller `B` obtained from the
removable vertex contradicts the IH.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- **Descent step (minimality form).**  A nonempty convex `K4` set
with `|A| > 9` cannot be a *minimal* counterexample.  Composing
`RemovableVertexOfLarge` (which now takes the minimality IH) with
`smaller_counterexample_of_removable` produces a strictly smaller
counterexample, contradicting the IH. -/
theorem descent_contradicts_minimality
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hgt : 9 < A.card)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) :
    False := by
  obtain ⟨x, hxrem⟩ := RemovableVertexOfLarge A hne hconv hK4 hgt hMin
  have hcard : 1 < A.card := by omega
  obtain ⟨B, hBne, hBlt, hBconv, hBbad⟩ :=
    smaller_counterexample_of_removable hconv hxrem hcard
  exact hMin B hBlt hBne hBconv hBbad

end Problem97
