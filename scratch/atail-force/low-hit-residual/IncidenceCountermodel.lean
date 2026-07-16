/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Scratch: abstract LowHit incidence countermodel

This is deliberately only a finite incidence model, not a Euclidean
`CounterexampleData` and not a `CriticalShellSystem`.  It checks that the
combinatorial data

* a four-point row disjoint from three anchors;
* a four-point source row through each of its four fresh points; and
* pairwise source-row intersections of cardinality at most two

does not force even one cross-incidence between distinct fresh sources.
Therefore the reciprocal incidences consumed by `LowHitResidual.lean` are
genuine new content; they cannot be obtained from LowHit cardinality and the
diagonal source-membership fields alone.
-/

namespace Problem97
namespace ATailLowHitResidualScratch

/-- Exact finite falsifier for a geometry-free cross-incidence producer. -/
theorem abstract_lowHit_rows_need_not_have_cross_incidence :
    let anchors : Finset (Fin 19) := {0, 1, 2}
    let base : Finset (Fin 19) := {3, 4, 5, 6}
    let sourceRow : Fin 19 → Finset (Fin 19) := fun z =>
      if z = 3 then {3, 7, 8, 9}
      else if z = 4 then {4, 10, 11, 12}
      else if z = 5 then {5, 13, 14, 15}
      else if z = 6 then {6, 16, 17, 18}
      else ∅
    base.card = 4 ∧
      (base ∩ anchors).card = 0 ∧
      (∀ z ∈ base, z ∈ sourceRow z ∧ (sourceRow z).card = 4) ∧
      (∀ z ∈ base, ∀ w ∈ base, z ≠ w →
        w ∉ sourceRow z ∧
          (sourceRow z ∩ sourceRow w).card ≤ 2) := by
  decide

#print axioms abstract_lowHit_rows_need_not_have_cross_incidence

end ATailLowHitResidualScratch
end Problem97
