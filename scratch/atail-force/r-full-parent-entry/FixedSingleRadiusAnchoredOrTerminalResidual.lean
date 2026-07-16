/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleAnchoredIntegration
import LeastTerminalHitReciprocalRowSplit

/-!
# Coherent fixed-radius orbit normal form

The cycle arm always reaches an anchored source-critical transition.  The
least-terminal-hit arm reaches the same transition unless it realizes the
single retained asymmetric directed-cross residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailRActualBlockerTransitionScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- The complete consumer-facing normal form of a coherent fixed-radius
actual-blocker orbit.  The only non-anchored output is the named terminal
asymmetric directed-cross residual. -/
theorem AmbientRobustHistoryPair.anchoredTransition_or_terminalDirectedCross
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius)
    (P : AmbientRobustHistoryPair D S T.carrier rho)
    (H : CriticalShellSystem D.A)
    (O : OppCap1OrderedData D S) :
    (∃ R : CoherentRCommonDeletionPacket T P H,
      Nonempty
        (CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition R)) ∨
    (∃ R : CoherentRCommonDeletionPacket T P H,
      Nonempty
        (CoherentRCommonDeletionPacket.ReciprocalDirectedCrossResidual R)) := by
  rcases
      Problem97.ATailRActualBlockerTransitionScratch.AmbientRobustHistoryPair.actualBlockerOrbit_terminalHit_or_sourceExactMinimalCycle
        P H T.history with hhit | hcycle
  · rcases
        Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_leastPositiveTerminalHitPredecessor
          P H T.history hhit with
      ⟨K⟩
    rcases
        Problem97.ATailRFullParentEntryScratch.LeastPositiveTerminalHitPredecessor.sourceOutside_or_reciprocalDirectedCross
          K with houtside | hcross
    · left
      rcases houtside with ⟨R, hRoutside⟩
      exact
        ⟨R,
          R.anchoredSourceCriticalTransition_of_sourceOutsideDeletedCriticalShell
            hRoutside⟩
    · exact Or.inr hcross
  · left
    rcases hcycle with ⟨K⟩
    exact
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_anchoredSourceCriticalTransition
        K O

#print axioms
  AmbientRobustHistoryPair.anchoredTransition_or_terminalDirectedCross

end ATailRFullParentEntryScratch
end Problem97
