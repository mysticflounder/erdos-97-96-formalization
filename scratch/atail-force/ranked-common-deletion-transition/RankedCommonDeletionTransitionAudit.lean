/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DirectedCycleCountermodel

/-!
# Scratch: local opposite-rank moves do not supply a global descent

The source-faithful common-deletion producer retains two actual blocker
centers, but it does not align them with the physical postmix centers.  Even
after separately supplying the stronger cap-local premise needed by the
postmix rank adapter, one still obtains only an opposite-side statement in a
cyclic boundary order.

This file packages the existing exact rational directed-cycle model as a
no-wrap regression.  Every displayed blocker bisects one directed source
pair and lies strictly between that pair in one fixed linear boundary cut.
Nevertheless, the third directed source edge crosses the cut, and no
natural-valued measure can strictly decrease around all three edges.

The result is a counterexample only to a consumer using local equal-radius
and cap-order data as a global descent.  The model does not carry global K4,
a total `CriticalShellSystem`, or the full common-deletion parent surface.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRankedCommonDeletionTransitionScratch

open ATailDirectedCycleGeometryScratch

/-- The three sources in directed-cycle order. -/
noncomputable def cycleSource : Fin 3 → ℝ² :=
  ![q0, q1, q2]

/-- The actual bisector center attached to each directed source edge. -/
noncomputable def cycleCenter : Fin 3 → ℝ² :=
  ![c0, c1, c2]

/-- Cyclic successor on the three source roles. -/
def nextSource : Fin 3 → Fin 3 :=
  ![1, 2, 0]

/-- Source positions in the fixed nine-point boundary enumeration. -/
def sourceBoundaryIndex : Fin 3 → Fin 9 :=
  ![2, 5, 7]

/-- Bisector-center positions in the same boundary enumeration. -/
def centerBoundaryIndex : Fin 3 → Fin 9 :=
  ![3, 6, 4]

/-- Every edge of the exact directed cycle is a genuine equal-radius pair at
its displayed center. -/
theorem cycleCenter_bisects_source_successor (i : Fin 3) :
    dist (cycleCenter i) (cycleSource i) =
      dist (cycleCenter i) (cycleSource (nextSource i)) := by
  rcases directed_cycle_bisectors with ⟨h0, h1, h2⟩
  fin_cases i
  · exact h0
  · exact h1
  · exact h2

/-- In one fixed boundary presentation, the center of every edge lies
strictly between its two equal-radius sources.  The final edge uses the
reverse linear orientation, which is exactly the wrap across the cyclic cut. -/
theorem cycleCenter_strictly_between_source_successor (i : Fin 3) :
    (sourceBoundaryIndex i < centerBoundaryIndex i ∧
        centerBoundaryIndex i < sourceBoundaryIndex (nextSource i)) ∨
      (sourceBoundaryIndex (nextSource i) < centerBoundaryIndex i ∧
        centerBoundaryIndex i < sourceBoundaryIndex i) := by
  fin_cases i <;> decide

/-- The directed source edges are not uniformly increasing in the same fixed
boundary cut: the last edge returns from index seven to index two. -/
theorem not_all_source_edges_increase_in_fixed_cut :
    ¬ ∀ i : Fin 3,
      sourceBoundaryIndex i < sourceBoundaryIndex (nextSource i) := by
  intro h
  have h2 := h (2 : Fin 3)
  change (7 : Fin 9) < (2 : Fin 9) at h2
  omega

/-- No natural-valued rank can strictly decrease along every edge of a
directed three-cycle.  A usable no-wrap consumer must therefore prove that
some edge is terminal, or retain an additional history invariant which
prevents the return edge from being generated. -/
theorem no_strict_descent_around_cycle (rank : Fin 3 → ℕ) :
    ¬ ∀ i : Fin 3, rank (nextSource i) < rank i := by
  intro h
  have h0 := h (0 : Fin 3)
  have h1 := h (1 : Fin 3)
  have h2 := h (2 : Fin 3)
  change rank 1 < rank 0 at h0
  change rank 2 < rank 1 at h1
  change rank 0 < rank 2 at h2
  omega

/-- Consolidated exact regression: strict convexity, local equal-radius
bisectors, and local opposite-side boundary ranks coexist with the absence of
any global strict descent around the directed cycle. -/
theorem exact_local_rank_cycle_no_global_descent :
    ConvexIndep carrier ∧
      (∀ i : Fin 3,
        dist (cycleCenter i) (cycleSource i) =
          dist (cycleCenter i) (cycleSource (nextSource i))) ∧
      (∀ i : Fin 3,
        (sourceBoundaryIndex i < centerBoundaryIndex i ∧
            centerBoundaryIndex i < sourceBoundaryIndex (nextSource i)) ∨
          (sourceBoundaryIndex (nextSource i) < centerBoundaryIndex i ∧
            centerBoundaryIndex i < sourceBoundaryIndex i)) ∧
      (∀ rank : Fin 3 → ℕ,
        ¬ ∀ i : Fin 3, rank (nextSource i) < rank i) := by
  exact ⟨carrier_convexIndep, cycleCenter_bisects_source_successor,
    cycleCenter_strictly_between_source_successor,
    no_strict_descent_around_cycle⟩

#print axioms cycleCenter_bisects_source_successor
#print axioms cycleCenter_strictly_between_source_successor
#print axioms not_all_source_edges_increase_in_fixed_cut
#print axioms no_strict_descent_around_cycle
#print axioms exact_local_rank_cycle_no_global_descent

end ATailRankedCommonDeletionTransitionScratch
end Problem97
