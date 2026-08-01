import Erdos9796Proof.P97.UniversalProblem97
import Erdos9796Proof.P97.SmallCardinality
import Erdos9796Proof.P97.Descent
import Erdos9796Proof.P97.PinnedMultiplicity

/-!
# Universal Problem 97 (instantiated, Milestone 5)

Instantiates `UniversalProblem97_of_reduction` (the M1 strong-induction
assembly) with the proven counting obstruction
`counterexample_card_ge_nine` and the proven descent step
`descent_contradicts_minimality`.

`Problem97.UniversalProblem97` is the full all-cardinality local statement
of Problem 97; it is **open**, and the whole of its openness enters through
`Problem97.RemovableVertexOfLarge` inside `descent_contradicts_minimality`.
Both other inputs are kernel-clean on core axioms alone:
`counterexample_card_ge_nine` and the `n = 9` base case
`Problem97.FiniteN9Closure` (closed 2026-07; the earlier docstring here
listed it as a placeholder, which is stale).

The unconditional small-cardinality consequence of those two clean inputs —
`counterexample_card_ge_ten` and its contrapositive
`not_hasNEquidistantProperty_four_of_card_le_nine` — lives in
`P97.SmallCardinality` and does **not** depend on the open descent step.
This file adds its pinned-multiplicity form.
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

/- ### Unconditional pinned-multiplicity closure -/

/-- **Pinned-multiplicity form of the small-cardinality closure.**

Every nonempty convex-independent `A : Finset ℝ²` with `|A| ≤ 9` contains a
point `p` whose pinned distance multiplicity is at most 3 — i.e. no circle of
positive radius centred at `p` carries four points of `A`.

This is `not_hasNEquidistantProperty_four_of_card_le_nine` transported across
`not_hasNEquidistantProperty_four_iff_exists_pinnedMultiplicity_le_three`, and
it is the `|A| ≤ 9` instance of the reformulation
`universalProblem97Statement_iff_pinnedMultiplicity`.  Unconditional: axiom
closure `{propext, Classical.choice, Quot.sound}`. -/
theorem exists_pinnedMultiplicity_le_three_of_card_le_nine
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hcard : A.card ≤ 9) :
    ∃ p ∈ A, pinnedMultiplicity A p ≤ 3 :=
  (not_hasNEquidistantProperty_four_iff_exists_pinnedMultiplicity_le_three A).mp
    (not_hasNEquidistantProperty_four_of_card_le_nine hne hconv hcard)

end Problem97
