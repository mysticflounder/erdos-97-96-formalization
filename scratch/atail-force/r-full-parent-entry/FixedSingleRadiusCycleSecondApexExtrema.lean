/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleCapLocalization

/-!
# Second-apex extrema on a coherent fixed-radius blocker cycle

Every canonical cycle source lies outside the surplus cap on one fixed circle
about the first opposite apex.  The already-proved two-apex reflection
contradiction therefore makes distance to the second opposite apex injective
on the canonical cycle.

A finite blocker cycle consequently has both a strict distance-increasing edge
and a strict distance-decreasing edge.  This is the first order-sensitive
cycle packet forced by the full Euclidean apex geometry; the earlier finite
incidence/order countermodels did not encode it.  No claim is made here that
either extremal edge is already a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

namespace SourceExactMinimalActualBlockerCycle

/-- The cyclic successor index in the canonical minimal-period orbit. -/
private noncomputable def successorIndex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) : Fin K.period :=
  ⟨(i.1 + 1) % K.period,
    Nat.mod_lt _ (lt_of_lt_of_le Nat.zero_lt_two K.two_le_period)⟩

/-- The actual blocker map advances the canonical source by one cyclic index,
including at the wrap edge. -/
private theorem blockerVertex_source_eq_successor
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    H.blockerVertex (K.source i) = K.source (successorIndex K i) := by
  apply Subtype.ext
  change
    (H.blockerVertex
      ((H.blockerVertex^[i.1]) K.base)).1 =
      ((H.blockerVertex^[(i.1 + 1) % K.period]) K.base).1
  have hiterate :
      (H.blockerVertex^[(i.1 + 1) % K.period]) K.base =
        (H.blockerVertex^[i.1 + 1]) K.base :=
    K.isPeriodicPt.iterate_mod_apply (i.1 + 1)
  rw [hiterate]
  simp [Function.iterate_succ_apply']

/-- Distinct canonical sources have distinct distances to the second opposite
apex.  Equality would be exactly the forbidden off-surplus two-apex shared-
radius pair. -/
theorem secondApexDistance_ne_of_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    {i j : Fin K.period} (hij : i ≠ j) :
    dist (K.source i).1 S.oppApex2 ≠
      dist (K.source j).1 S.oppApex2 := by
  intro hsecond
  have hsources : (K.source i).1 ≠ (K.source j).1 := by
    intro h
    exact hij (K.source_injective (Subtype.ext h))
  have hiFixed :=
    Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_fixedClass
      K i
  have hjFixed :=
    Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_fixedClass
      K j
  have hiFirst : dist (K.source i).1 S.oppApex1 = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hiFixed).2
  have hjFirst : dist (K.source j).1 S.oppApex1 = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hjFixed).2
  have hiOff :=
    Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_off_surplus_of_fixedRadius
      K i
  have hjOff :=
    Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_off_surplus_of_fixedRadius
      K j
  exact
    (Problem97.U2NonSurplusSqueeze.oppCap2_escape_gen
      D S (K.source i).2 (K.source j).2 hiOff hjOff hsources
      hiFirst hjFirst rfl hsecond.symm).elim

/-- The two extremal edges forced by injectivity of second-apex distance on
the finite canonical blocker cycle. -/
structure SecondApexDistanceExtrema
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) where
  minimum : Fin K.period
  maximum : Fin K.period
  minimum_lt_blocker :
    dist (K.source minimum).1 S.oppApex2 <
      dist (H.blockerVertex (K.source minimum)).1 S.oppApex2
  blocker_lt_maximum :
    dist (H.blockerVertex (K.source maximum)).1 S.oppApex2 <
      dist (K.source maximum).1 S.oppApex2

/-- Every coherent fixed-radius canonical cycle has a strict increasing and a
strict decreasing actual-blocker edge when ordered by second-apex distance. -/
theorem nonempty_secondApexDistanceExtrema
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    Nonempty (SecondApexDistanceExtrema K) := by
  classical
  let f : Fin K.period → ℝ := fun i => dist (K.source i).1 S.oppApex2
  have huniv : (Finset.univ : Finset (Fin K.period)).Nonempty :=
    ⟨⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩, by simp⟩
  rcases Finset.exists_min_image Finset.univ f huniv with
    ⟨imin, _himin, hmin⟩
  rcases Finset.exists_max_image Finset.univ f huniv with
    ⟨imax, _himax, hmax⟩
  let inext := successorIndex K imin
  let jnext := successorIndex K imax
  have himinNext : imin ≠ inext := by
    intro h
    have hsource : K.source imin = K.source inext := congrArg K.source h
    have hedge := blockerVertex_source_eq_successor K imin
    exact H.blockerVertex_ne (K.source imin) (hedge.trans hsource.symm)
  have himaxNext : imax ≠ jnext := by
    intro h
    have hsource : K.source imax = K.source jnext := congrArg K.source h
    have hedge := blockerVertex_source_eq_successor K imax
    exact H.blockerVertex_ne (K.source imax) (hedge.trans hsource.symm)
  have hminLe : f imin ≤ f inext := hmin inext (by simp)
  have hmaxLe : f jnext ≤ f imax := hmax jnext (by simp)
  have hminNe : f imin ≠ f inext :=
    Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.secondApexDistance_ne_of_ne
      K himinNext
  have hmaxNe : f jnext ≠ f imax := by
    exact
      (Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.secondApexDistance_ne_of_ne
        K himaxNext).symm
  refine ⟨{
    minimum := imin
    maximum := imax
    minimum_lt_blocker := ?_
    blocker_lt_maximum := ?_ }⟩
  · rw [blockerVertex_source_eq_successor K imin]
    exact lt_of_le_of_ne hminLe hminNe
  · rw [blockerVertex_source_eq_successor K imax]
    exact lt_of_le_of_ne hmaxLe hmaxNe

#print axioms secondApexDistance_ne_of_ne
#print axioms nonempty_secondApexDistanceExtrema

end SourceExactMinimalActualBlockerCycle

end ATailRFullParentEntryScratch
end Problem97
