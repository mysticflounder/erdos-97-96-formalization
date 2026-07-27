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

Each is also given in a **conditional** form taking Erdős 97 as an explicit
hypothesis (`…_of_erdos97`), because that is where the honest content of this
branch sits: the implication *Erdős 97 ⟹ Erdős 96, with explicit constant 3*
is fully proved, on core axioms alone.

This file is sorry-free, and so is the whole conditional chain
`peel_vertex_exists_of_erdos97 → doubledUnitCount_bound_of_erdos97 →
unit_distance_pairs_bound_of_erdos97 → maxConvexUnitDistances_le_three_mul_of_erdos97
→ erdos96_rhs_of_erdos97`.  The unconditional names discharge the hypothesis
with `Problem97.UniversalProblem97` and therefore inherit its `sorry`:
`Problem97.UniversalProblem97` is **open**, reaching `sorryAx` through the six
A-tail frontier obligations in
`Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean` below
`RemovableVertexOfLarge`.  `Problem97.UniversalProblem97` is the sole gateway
through which openness enters this branch; every P96-specific declaration is
kernel-clean.
-/

open scoped EuclideanGeometry
open Filter

namespace Problem96

/-- **Erdős 97 ⟹ the supremum form of the Erdős 96 bound.** Given Erdős 97
as a hypothesis, every convex-position `n`-point set determines at most
`3 * n` unit distances, so the supremum `Erdos96.maxConvexUnitDistances n`
is bounded by `3 * n` too (the empty case is `sSup ∅ = 0`).  Kernel-clean on
core axioms. -/
theorem maxConvexUnitDistances_le_three_mul_of_erdos97
    (hP97 : Problem97.UniversalProblem97Statement) (n : ℕ) :
    Erdos96.maxConvexUnitDistances n ≤ 3 * n := by
  unfold Erdos96.maxConvexUnitDistances
  rcases Set.eq_empty_or_nonempty (Erdos96.convexUnitDistanceCounts n) with h | h
  · rw [h, csSup_empty]
    exact bot_le
  · refine csSup_le h ?_
    rintro x ⟨points, hcard, hConv, rfl⟩
    calc EuclideanGeometry.unitDistancePairsCount points
        ≤ 3 * points.card := unit_distance_pairs_bound_of_erdos97 hP97 hConv
      _ = 3 * n := by rw [hcard]

/-- Supremum form against the project's own P97 assembly; inherits its open
A-tail obligations. -/
theorem maxConvexUnitDistances_le_three_mul (n : ℕ) :
    Erdos96.maxConvexUnitDistances n ≤ 3 * n :=
  maxConvexUnitDistances_le_three_mul_of_erdos97 Problem97.UniversalProblem97 n

/-- **Erdős 97 ⟹ Erdős 96.** Given Erdős 97 as a hypothesis — `hP97` is the
RHS of upstream `Erdos97.erdos_97` verbatim — the maximum number of unit
distances determined by `n` points in convex position is `O(n)`, with
explicit constant `3`.

This is the headline reduction of the P96 branch and it is **unconditionally
proved**: axiom closure `{propext, Classical.choice, Quot.sound}`.  The
unconditional `erdos96_rhs` below is this theorem applied to the still-open
`Problem97.UniversalProblem97`. -/
theorem erdos96_rhs_of_erdos97
    (hP97 : Problem97.UniversalProblem97Statement) :
    (fun n => (Erdos96.maxConvexUnitDistances n : ℝ)) =O[atTop]
      fun n => (n : ℝ) := by
  refine Asymptotics.isBigO_of_le' (c := 3) atTop fun n => ?_
  rw [Real.norm_natCast, Real.norm_natCast]
  exact_mod_cast maxConvexUnitDistances_le_three_mul_of_erdos97 hP97 n

/-- **Upstream-vocabulary form.** The RHS of `Erdos96.erdos_96` (with
answer = *yes*): the maximum unit-distance count over convex `n`-gons is
`O(n)`, with explicit constant `3`.

`erdos96_rhs_of_erdos97` applied to `Problem97.UniversalProblem97`; inherits
that theorem's open obligations, so this publish target is **open**. -/
theorem erdos96_rhs :
    (fun n => (Erdos96.maxConvexUnitDistances n : ℝ)) =O[atTop]
      fun n => (n : ℝ) :=
  erdos96_rhs_of_erdos97 Problem97.UniversalProblem97

end Problem96
