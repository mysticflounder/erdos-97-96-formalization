/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFiveGoodSourceClosure

/-!
# Exact-five `u`-heavy good-source placement

The strict second-cap interior is the named triple `u, xu, xv`.  A regenerated
good source is distinct from the original source `u`, while its omitted peer
is distinct from the good source.  Consequently the restart has exactly four
point-level placements.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- Exhaustive point-level placement of a regenerated good source and its
omitted strict-interior peer in the exact-five `u`-heavy branch. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_goodSource_placement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (hinterior :
      S.capInteriorByIndex S.oppIndex2 = {P.u.1, xu, xv})
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource) :
    (goodSource.1 = xu ∧
        (Q.omittedPeer.1 = P.u.1 ∨ Q.omittedPeer.1 = xv)) ∨
      (goodSource.1 = xv ∧
        (Q.omittedPeer.1 = P.u.1 ∨ Q.omittedPeer.1 = xu)) := by
  classical
  have hgoodCases :
      goodSource.1 = P.u.1 ∨
        goodSource.1 = xu ∨ goodSource.1 = xv := by
    have hmem := Q.good_mem_interior
    rw [hinterior] at hmem
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hmem
  have hpeerCases :
      Q.omittedPeer.1 = P.u.1 ∨
        Q.omittedPeer.1 = xu ∨ Q.omittedPeer.1 = xv := by
    have hmem := Q.omittedPeer_mem_interior
    rw [hinterior] at hmem
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hmem
  rcases hgoodCases with hgoodU | hgoodXu | hgoodXv
  · exfalso
    apply Q.good_ne_original
    apply Subtype.ext
    simpa only [P.huSource] using hgoodU
  · refine Or.inl ⟨hgoodXu, ?_⟩
    rcases hpeerCases with hpeerU | hpeerXu | hpeerXv
    · exact Or.inl hpeerU
    · exfalso
      apply Q.omittedPeer_ne_good
      apply Subtype.ext
      exact hpeerXu.trans hgoodXu.symm
    · exact Or.inr hpeerXv
  · refine Or.inr ⟨hgoodXv, ?_⟩
    rcases hpeerCases with hpeerU | hpeerXu | hpeerXv
    · exact Or.inl hpeerU
    · exact Or.inr hpeerXu
    · exfalso
      apply Q.omittedPeer_ne_good
      apply Subtype.ext
      exact hpeerXv.trans hgoodXv.symm

end ATailFrontierLiveClosure
end Problem97
