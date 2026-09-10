<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Statement and trust provenance

This packet is pinned to repository revision
`0707e2c26e2e570e2b56ce656242cf5dec4d2584`.

| Role | Declaration | Source |
|---|---|---|
| Statement | `Problem97.RemovableVertexOfLargeStatement` | `lean/Erdos9796Proof/P97/RemovableVertexAxiom/Base.lean:53` |
| Source theorem | `Problem97.RemovableVertexOfLarge` | `lean/Erdos9796Proof/P97/RemovableVertexAxiom/RemovableVertexOfLarge.lean:50` |
| Removability predicate | `Problem97.IsRemovableVertex` | `lean/Erdos9796Proof/P97/SmallerCounterexample.lean:25` |
| Descent consumer | `Problem97.descent_contradicts_minimality` | `lean/Erdos9796Proof/P97/Descent.lean:27` |
| Platform theorem | `Erdos9796Mission.minimal_counterexample_removable` | `prove2me/Theorems/Thm_Erdos9796Mission_minimal_counterexample_removable.lean` |

The repository statement quantifies over `A : Finset ℝ²` and assumes, in order:

1. `A.Nonempty`;
2. `ConvexIndep A`;
3. `HasNEquidistantProperty 4 A`;
4. `9 < A.card`; and
5. a strong-induction hypothesis proving `False` for every smaller nonempty,
   convex-independent set satisfying the four-equidistant property.

It concludes `∃ x : ℝ², IsRemovableVertex A x`. The definition of
`IsRemovableVertex A x` is the conjunction
`x ∈ A ∧ HasNEquidistantProperty 4 (A.erase x)`. The platform theorem uses
`Plane := EuclideanSpace ℝ (Fin 2)`, writes convex independence on the coerced set,
and exposes the two conjuncts as `∃ x ∈ A, HasNEquidistantProperty 4 (A.erase x)`.
Thus each source hypothesis and both parts of the source conclusion appear in the
platform statement.

The immediate repository consumer erases the supplied vertex, obtains a strictly
smaller nonempty convex-independent counterexample, and applies the strong-induction
hypothesis. At the mission level, this supplies the large-cardinality branch after the
counting theorem has forced cardinality at least nine and the finite theorem has ruled
out cardinality nine.

The exact source theorem contains no local `sorry` and introduces no named axiom.
Its current transitive trust closure is not clean: the non-`IsM44` branch reaches
`ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap`, which carries
`sorryAx`, and the pinned-surplus branch depends on native/compiler trust through
finite certificate banks. The existing Prove2Me theorem and milestone therefore stay
Open, and this packet submits no proof.

The theorem-bank reuse preflight for this exact candidate found no separate reusable
theorem that discharges the remaining transitive obligation. The exact local source,
its statement abbreviation, its consumer, and its trust boundary were audited instead.

Dumitrescu's work is cited for the separate isosceles-counting route used elsewhere in
the mission. The strong-induction/removable-vertex reduction documented here is this
project's formalization, so this packet does not assign the whole descent theorem to
Dumitrescu.

