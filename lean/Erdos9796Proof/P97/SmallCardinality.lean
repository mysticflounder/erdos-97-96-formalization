/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Counting
import Erdos9796Proof.P97.N9Endpoint.Closure

/-!
# Small-cardinality closure for Problem 97

The counting obstruction and the `n = 9` endpoint are both kernel-clean on
core axioms alone, and together they settle Problem 97 below cardinality 10
without touching the open descent step.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- **Every Problem-97 counterexample has at least 10 points.**

A nonempty convex-independent `A : Finset ℝ²` in which every point has four
others of `A` equidistant from it satisfies `10 ≤ |A|`.  Composed from the
counting obstruction `counterexample_card_ge_nine` (`9 ≤ |A|`) and the
finite endpoint `FiniteN9Closure` (`|A| ≠ 9`).

Unconditional: its axiom closure is `{propext, Classical.choice, Quot.sound}`
— it does **not** descend into the open A-tail frontier. -/
theorem counterexample_card_ge_ten
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) : 10 ≤ A.card := by
  rcases (counterexample_card_ge_nine hne hconv hK4).lt_or_eq with hlt | heq
  · omega
  · exact absurd hK4 (FiniteN9Closure A heq.symm hconv)

/-- **Problem 97 holds for every point set of at most 9 points.**

The contrapositive of `counterexample_card_ge_ten`: a nonempty
convex-independent `A : Finset ℝ²` with `|A| ≤ 9` has some point with no
four others of `A` equidistant from it.  Same kernel-clean axiom closure. -/
theorem not_hasNEquidistantProperty_four_of_card_le_nine
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hcard : A.card ≤ 9) : ¬ HasNEquidistantProperty 4 A := by
  intro hK4
  have := counterexample_card_ge_ten hne hconv hK4
  omega

end Problem97
