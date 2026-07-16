/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ActualBlockerMinimalCycle
import RetainedPointProvenance

/-!
# Source-exact predecessor of the least terminal blocker-orbit hit

An arbitrary terminal hit does not name the robust source whose actual
blocker is the hit vertex.  Taking the least hit time makes its predecessor
erased.  The retained robust history then reconstructs a pair with exactly
that predecessor as source, and one blocker-map step identifies its actual
blocker with the terminal hit.

The final theorem feeds that reconstructed pair into the source-derived
terminal endpoint/residual and HIT/OMISSION payload.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The source-exact robust predecessor of the least positive terminal hit in
an actual-blocker orbit. -/
structure LeastPositiveTerminalHitPredecessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) where
  hitTime : ℕ
  hitTime_pos : 0 < hitTime
  hit_mem_terminal :
    ((H.blockerVertex^[hitTime]) (actualBlockerStartVertex P)).1 ∈ C
  before_hit_not_mem :
    ∀ m : ℕ, m < hitTime →
      ((H.blockerVertex^[m]) (actualBlockerStartVertex P)).1 ∉ C
  predecessor_mem_erased :
    ((H.blockerVertex^[hitTime - 1])
      (actualBlockerStartVertex P)).1 ∈ D.A \ C
  predecessorRadius : ℝ
  predecessorPair : AmbientRobustHistoryPair D S C predecessorRadius
  predecessor_source_eq :
    predecessorPair.x =
      ((H.blockerVertex^[hitTime - 1])
        (actualBlockerStartVertex P)).1
  predecessor_blocker_eq_hit :
    H.centerAt predecessorPair.x
        (mem_selectedClass.mp predecessorPair.x_mem_class).1 =
      ((H.blockerVertex^[hitTime]) (actualBlockerStartVertex P)).1

/-- A terminal orbit hit has a least positive hit and a source-exact robust
predecessor whose actual blocker is exactly that hit. -/
theorem AmbientRobustHistoryPair.exists_leastPositiveTerminalHitPredecessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (Hhist : RobustPairedErasureHistory D S D.A C)
    (hhit : ∃ n : ℕ,
      ((H.blockerVertex^[n]) (actualBlockerStartVertex P)).1 ∈ C) :
    Nonempty (LeastPositiveTerminalHitPredecessor P H) := by
  let n : ℕ := Nat.find hhit
  have hnHit :
      ((H.blockerVertex^[n]) (actualBlockerStartVertex P)).1 ∈ C := by
    simpa [n] using Nat.find_spec hhit
  have hnPos : 0 < n := by
    by_contra hnNotPos
    have hnZero : n = 0 := Nat.eq_zero_of_not_pos hnNotPos
    have hxC : P.x ∈ C := by
      simpa [hnZero, actualBlockerStartVertex] using hnHit
    exact (Finset.mem_sdiff.mp P.x_mem_erased).2 hxC
  have hbefore :
      ∀ m : ℕ, m < n →
        ((H.blockerVertex^[m]) (actualBlockerStartVertex P)).1 ∉ C := by
    intro m hm hmC
    have hnLe : n ≤ m := by
      simpa [n] using Nat.find_min' hhit hmC
    omega
  let predecessor : CriticalShellSystem.CarrierVertex D.A :=
    (H.blockerVertex^[n - 1]) (actualBlockerStartVertex P)
  have hpredecessorErased : predecessor.1 ∈ D.A \ C := by
    exact Finset.mem_sdiff.mpr
      ⟨predecessor.2, hbefore (n - 1) (by omega)⟩
  rcases exists_ambientRobustHistoryPair_with_source_of_erased
      D S Hhist hpredecessorErased with
    ⟨rhoPredecessor, Q, hQSource⟩
  have hQStart : actualBlockerStartVertex Q = predecessor := by
    apply Subtype.ext
    exact hQSource
  have hnSucc : n - 1 + 1 = n := by omega
  have hpredecessorStep :
      H.blockerVertex predecessor =
        (H.blockerVertex^[n]) (actualBlockerStartVertex P) := by
    have hstep := Function.iterate_succ_apply'
      H.blockerVertex (n - 1) (actualBlockerStartVertex P)
    simpa [predecessor, hnSucc] using hstep.symm
  have hQBlockerVertex :
      H.blockerVertex (actualBlockerStartVertex Q) =
        (H.blockerVertex^[n]) (actualBlockerStartVertex P) := by
    rw [hQStart]
    exact hpredecessorStep
  have hQBlocker :
      H.centerAt Q.x (mem_selectedClass.mp Q.x_mem_class).1 =
        ((H.blockerVertex^[n]) (actualBlockerStartVertex P)).1 := by
    have hvalue := congrArg Subtype.val hQBlockerVertex
    simpa [actualBlockerStartVertex, CriticalShellSystem.blockerVertex] using
      hvalue
  exact ⟨
    { hitTime := n
      hitTime_pos := hnPos
      hit_mem_terminal := hnHit
      before_hit_not_mem := hbefore
      predecessor_mem_erased := by
        simpa [predecessor] using hpredecessorErased
      predecessorRadius := rhoPredecessor
      predecessorPair := Q
      predecessor_source_eq := by
        simpa [predecessor] using hQSource
      predecessor_blocker_eq_hit := hQBlocker }⟩

namespace LeastPositiveTerminalHitPredecessor

/-- The reconstructed predecessor's actual blocker is retained, because it is
the least hit vertex. -/
theorem predecessor_blocker_mem_terminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : LeastPositiveTerminalHitPredecessor P H) :
    H.centerAt K.predecessorPair.x
      (mem_selectedClass.mp K.predecessorPair.x_mem_class).1 ∈ C := by
  rw [K.predecessor_blocker_eq_hit]
  exact K.hit_mem_terminal

/-- Apply the exact retained-blocker terminal payload to the source-exact
predecessor of the least hit. -/
theorem retainedActualBlockerTerminalPayload
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : LeastPositiveTerminalHitPredecessor P H)
    (hterminal : FirstApexTerminalOn D S C) :
    RetainedActualBlockerTerminalPayload K.predecessorPair H := by
  exact
    Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.retainedActualBlockerTerminalPayload
      K.predecessorPair H hterminal K.predecessor_blocker_mem_terminal

end LeastPositiveTerminalHitPredecessor

/-- End-to-end terminal-hit refinement: the orbit's least positive hit has a
source-exact robust predecessor, and that predecessor carries the complete
source-derived terminal role and HIT/OMISSION payload. -/
theorem AmbientRobustHistoryPair.exists_leastPositiveTerminalHitPredecessor_with_payload
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (Hhist : RobustPairedErasureHistory D S D.A C)
    (hterminal : FirstApexTerminalOn D S C)
    (hhit : ∃ n : ℕ,
      ((H.blockerVertex^[n]) (actualBlockerStartVertex P)).1 ∈ C) :
    ∃ K : LeastPositiveTerminalHitPredecessor P H,
      RetainedActualBlockerTerminalPayload K.predecessorPair H := by
  rcases
      Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_leastPositiveTerminalHitPredecessor
        P H Hhist hhit with
    ⟨K⟩
  exact ⟨K, K.retainedActualBlockerTerminalPayload hterminal⟩

/-- Refine the complete source-faithful orbit dichotomy so its terminal arm
already contains the source-exact least-hit predecessor and its terminal
payload.  The normalized erased-cycle arm is unchanged. -/
theorem AmbientRobustHistoryPair.actualBlockerOrbit_terminalPayload_or_sourceExactMinimalCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (Hhist : RobustPairedErasureHistory D S D.A C)
    (hterminal : FirstApexTerminalOn D S C) :
    (∃ K : LeastPositiveTerminalHitPredecessor P H,
      RetainedActualBlockerTerminalPayload K.predecessorPair H) ∨
      Nonempty (SourceExactMinimalActualBlockerCycle P H) := by
  rcases
      Problem97.ATailRActualBlockerTransitionScratch.AmbientRobustHistoryPair.actualBlockerOrbit_terminalHit_or_sourceExactMinimalCycle
        P H Hhist with
    hhit | hcycle
  · exact Or.inl
      (Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_leastPositiveTerminalHitPredecessor_with_payload
        P H Hhist hterminal hhit)
  · exact Or.inr hcycle

#print axioms AmbientRobustHistoryPair.exists_leastPositiveTerminalHitPredecessor
#print axioms LeastPositiveTerminalHitPredecessor.predecessor_blocker_mem_terminal
#print axioms LeastPositiveTerminalHitPredecessor.retainedActualBlockerTerminalPayload
#print axioms AmbientRobustHistoryPair.exists_leastPositiveTerminalHitPredecessor_with_payload
#print axioms AmbientRobustHistoryPair.actualBlockerOrbit_terminalPayload_or_sourceExactMinimalCycle

end

end ATailRFullParentEntryScratch
end Problem97
