import Erdos9796Proof.P97.SmallerCounterexample

/-!
# Removable-vertex existence for `|A| > 9` (the single open lemma)

`RemovableVertexOfLarge` is the **one remaining `sorry`** on the
Problem 97 spine.  It states the substantive output of the surplus-cap
analysis:

  Every nonempty convex `HasNEquidistantProperty 4` set with `9 < |A|`
  that is minimal under the strong-induction hypothesis contains a
  removable vertex.

This is the hard core of the descent step: the uniform removability of a
surplus-cap vertex.  Everything else in the proof — the `n = 9`
endpoint and the descent wrapper that consumes this lemma — is fully
formalized and kernel-closed; this is the sole gap.

The acceptance criterion is that, once this is replaced by a proof,
`#print axioms Problem97.erdos97_rhs` reports only Lean core axioms
(`propext`, `Classical.choice`, `Quot.sound`) with no `sorryAx`.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- Statement that every nonempty convex `K4` set with `|A| > 9`
admits a removable vertex (M4 surplus-cap output shape).

The trailing hypothesis is the strong-induction IH provided by the
`UniversalProblem97_of_reduction` wrapper: every strictly smaller
nonempty convex 4-equidistant set is contradictory (no smaller K4
counterexample exists).  Carrying it through the statement lets the
proof assume minimality, which significantly simplifies the
K4-witness pinning step. -/
abbrev RemovableVertexOfLargeStatement : Prop :=
  ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
    HasNEquidistantProperty 4 A → 9 < A.card →
    (∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∃ x : ℝ², IsRemovableVertex A x

/-- **Removable-vertex existence for `|A| > 9` counterexamples.**
Currently a `sorry`-backed placeholder for the M4 surplus-cap output;
will be replaced by a proven theorem once the U1–U7 program closes. -/
theorem RemovableVertexOfLarge : RemovableVertexOfLargeStatement := sorry

end Problem97
