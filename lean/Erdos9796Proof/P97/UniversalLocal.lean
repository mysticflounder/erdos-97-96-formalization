import Erdos9796Proof.P97.UniversalProblem97
import Erdos9796Proof.P97.Counting
import Erdos9796Proof.P97.Descent

/-!
# Universal Problem 97 (instantiated, Milestone 5)

Instantiates `UniversalProblem97_of_reduction` (the M1 strong-induction
assembly) with the proven counting obstruction
`counterexample_card_ge_nine` and the proven descent step
`descent_contradicts_minimality`.

Modulo the two current project placeholders

  * `Problem97.FiniteN9Closure`
  * `Problem97.RemovableVertexOfLarge`

this is the full all-cardinality local statement of Problem 97.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- Bundled `UniversalReductionHypotheses` provided by the proven
counting + descent assembly. -/
theorem universalReductionHypotheses : UniversalReductionHypotheses where
  counting := fun _A hne hconv hbad => counterexample_card_ge_nine hne hconv hbad
  descent  := fun _A hne hconv hbad hgt hMin =>
    descent_contradicts_minimality hne hconv hbad hgt hMin

/-- **Universal Problem 97 (local form).**  Every nonempty
convex-independent finite point set in `ℝ²` has some vertex with at
most three other vertices equidistant from it.  Modulo the two
tracked axioms, this is the full Problem 97 statement. -/
theorem UniversalProblem97 : UniversalProblem97Statement :=
  UniversalProblem97_of_reduction universalReductionHypotheses

end Problem97
