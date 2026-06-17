import FormalConjectures.ErdosProblems.«96»
import Erdos9796Proof.P96.EuclideanPeeling

/-!
# Upstream-vocabulary bridge to `Erdos96.erdos_96`

`EuclideanPeeling.lean` proves the headline P96 bound
`Problem96.unit_distance_pairs_bound`: every convex-independent
`A : Finset ℝ²` satisfies
`EuclideanGeometry.unitDistancePairsCount A ≤ 3 * A.card`. Since
`Problem97.ConvexIndep` is an **abbreviation** for
`EuclideanGeometry.ConvexIndep ↑·`, that statement is already in the
upstream vocabulary of `FormalConjectures/ErdosProblems/96.lean`.

This file packages the per-set bound into the supremum form used by the
upstream statement `Erdos96.erdos_96`:

* `maxConvexUnitDistances_le_three_mul` — every member of
  `Erdos96.convexUnitDistanceCounts n` is `≤ 3 * n`, hence so is the
  `sSup` defining `Erdos96.maxConvexUnitDistances n` (the empty case is
  `sSup ∅ = 0`);
* `erdos96_rhs` — the RHS of `Erdos96.erdos_96` with answer *yes*:
  the maximum unit-distance count over convex `n`-gons is `O(n)`, with
  explicit constant `3`.

The axiom closure inherits the single remaining placeholder `sorry` of
`Problem97.UniversalProblem97` (`RemovableVertexOfLarge`) through
`unit_distance_pairs_bound`; this file itself is sorry-free.
-/

open scoped EuclideanGeometry
open Filter

namespace Problem96

/-- Every convex-position `n`-point set determines at most `3 * n` unit
distances (`Problem96.unit_distance_pairs_bound`), so the supremum
`Erdos96.maxConvexUnitDistances n` over all such sets is bounded by
`3 * n` as well. -/
theorem maxConvexUnitDistances_le_three_mul (n : ℕ) :
    Erdos96.maxConvexUnitDistances n ≤ 3 * n := by
  unfold Erdos96.maxConvexUnitDistances
  rcases Set.eq_empty_or_nonempty (Erdos96.convexUnitDistanceCounts n) with h | h
  · rw [h, csSup_empty]
    exact bot_le
  · refine csSup_le h ?_
    rintro x ⟨points, hcard, hConv, rfl⟩
    calc EuclideanGeometry.unitDistancePairsCount points
        ≤ 3 * points.card := unit_distance_pairs_bound hConv
      _ = 3 * n := by rw [hcard]

/-- **Upstream-vocabulary form.** The RHS of `Erdos96.erdos_96` (with
answer = *yes*): the maximum unit-distance count over convex `n`-gons is
`O(n)`, with explicit constant `3`. -/
theorem erdos96_rhs :
    (fun n => (Erdos96.maxConvexUnitDistances n : ℝ)) =O[atTop]
      fun n => (n : ℝ) := by
  refine Asymptotics.isBigO_of_le' (c := 3) atTop fun n => ?_
  rw [Real.norm_natCast, Real.norm_natCast]
  exact_mod_cast maxConvexUnitDistances_le_three_mul n

end Problem96
