/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ActualBlockerRobustSuccessor

/-!
# Source-faithful actual-blocker orbit normal form

Iterate the retained critical system's actual blocker map from one erased
robust source. Either the orbit reaches the terminal carrier, or finiteness
produces a genuine blocker cycle. On the no-terminal branch every orbit source
remains erased, so the retained history reconstructs a complete ambient robust
pair with exactly that source.

This is the correct finite iteration object. It asserts no cap-rank or
global-boundary progress, and the checked blocker two-cycle shows why the
cycle branch is not itself contradictory.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRActualBlockerTransitionScratch

open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Starting from an erased robust source, the deterministic actual-blocker
orbit either reaches the terminal carrier or enters a genuine period at least
two. In the latter case every source on the whole reachable orbit has a
source-exact ambient robust-history pair. -/
theorem AmbientRobustHistoryPair.actualBlockerOrbit_terminalHit_or_erasedCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (Hhist : RobustPairedErasureHistory D S D.A C) :
    let start : CriticalShellSystem.CarrierVertex D.A :=
      ⟨P.x, (mem_selectedClass.mp P.x_mem_class).1⟩
    (∃ n : ℕ, ((H.blockerVertex^[n]) start).1 ∈ C) ∨
      ∃ m k : ℕ,
        2 ≤ k ∧
        Function.IsPeriodicPt H.blockerVertex k
          ((H.blockerVertex^[m]) start) ∧
        ∀ n : ℕ,
          ((H.blockerVertex^[n]) start).1 ∈ D.A \ C ∧
          ∃ rho' : ℝ,
            ∃ P' : AmbientRobustHistoryPair D S C rho',
              P'.x = ((H.blockerVertex^[n]) start).1 := by
  let start : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.x, (mem_selectedClass.mp P.x_mem_class).1⟩
  change (∃ n : ℕ, ((H.blockerVertex^[n]) start).1 ∈ C) ∨
    ∃ m k : ℕ,
      2 ≤ k ∧
      Function.IsPeriodicPt H.blockerVertex k
        ((H.blockerVertex^[m]) start) ∧
      ∀ n : ℕ,
        ((H.blockerVertex^[n]) start).1 ∈ D.A \ C ∧
        ∃ rho' : ℝ,
          ∃ P' : AmbientRobustHistoryPair D S C rho',
            P'.x = ((H.blockerVertex^[n]) start).1
  by_cases hterminal : ∃ n : ℕ, ((H.blockerVertex^[n]) start).1 ∈ C
  · exact Or.inl hterminal
  · right
    have herased :
        ∀ n : ℕ, ((H.blockerVertex^[n]) start).1 ∈ D.A \ C := by
      intro n
      refine Finset.mem_sdiff.mpr ⟨
        ((H.blockerVertex^[n]) start).2, ?_⟩
      intro hmem
      exact hterminal ⟨n, hmem⟩
    rcases ATailRComplementBlockerMapScratch.exists_reachable_blocker_cycle
        H start with ⟨m, k, hk, hperiodic⟩
    refine ⟨m, k, hk, hperiodic, ?_⟩
    intro n
    exact ⟨herased n,
      exists_ambientRobustHistoryPair_with_source_of_erased
        D S Hhist (herased n)⟩

#print axioms AmbientRobustHistoryPair.actualBlockerOrbit_terminalHit_or_erasedCycle

end ATailRActualBlockerTransitionScratch
end Problem97
