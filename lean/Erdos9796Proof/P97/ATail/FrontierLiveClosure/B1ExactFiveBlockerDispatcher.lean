/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1ExactFiveSourceBlockerOutcome

/-!
# B1 exact-five blocker dispatcher

The exact-five source split and its source-blocker split are individually
source-clean.  This module composes them into one proof-relevant outcome, so a
later terminal can consume every branch without discarding the rigid cover or
the singleton minimal-core data.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

/-- The complete proof-relevant exact-five B1 outcome.  The first arm records a
second joint deletion; the remaining four arms retain the source-equality or
third-row parent together with the inside/outside source-blocker outcome. -/
inductive B1ExactFiveBlockerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C) : Type
  | secondDeletion
      (K : ExactFourMutualOmissionJointDeletion C.R C.rho G.u G.v)
      (deleted_ne : K.deleted ≠ G.jointDeletion.deleted) :
      B1ExactFiveBlockerOutcome C G
  | sourceEqOutside
      (P : B1ExactFiveSourceEqUBlockerOutsideResidual C G) :
      B1ExactFiveBlockerOutcome C G
  | sourceEqInside
      (P : B1ExactFiveSourceEqUBlockerInsideResidual C G) :
      B1ExactFiveBlockerOutcome C G
  | thirdRowOutside
      (P : B1ExactFiveThirdRowBlockerOutsideResidual C G) :
      B1ExactFiveBlockerOutcome C G
  | thirdRowInside
      (P : B1ExactFiveThirdRowBlockerInsideResidual C G) :
      B1ExactFiveBlockerOutcome C G

/-- Compose the repaired exact-five source split with the exhaustive
source-blocker split. -/
theorem nonempty_b1ExactFiveBlockerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C)
    (hclassFive : (SelectedClass D.A S.oppApex2 C.rho).card = 5) :
    Nonempty (B1ExactFiveBlockerOutcome C G) := by
  rcases b1ExactFiveSourceThirdRow_or_secondDeletion_or_sourceEq
      C G hclassFive with hsecond | heq | hthird
  · rcases hsecond with ⟨K, hdeleted_ne⟩
    exact ⟨.secondDeletion K hdeleted_ne⟩
  · rcases heq with ⟨P⟩
    rcases b1ExactFiveSourceEqU_blockerOutcome C G P with houtside | hinside
    · exact ⟨.sourceEqOutside houtside.some⟩
    · exact ⟨.sourceEqInside hinside.some⟩
  · rcases hthird with ⟨P⟩
    rcases b1ExactFiveThirdRow_blockerOutcome C G P with houtside | hinside
    · exact ⟨.thirdRowOutside houtside.some⟩
    · exact ⟨.thirdRowInside hinside.some⟩

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.nonempty_b1ExactFiveBlockerOutcome
