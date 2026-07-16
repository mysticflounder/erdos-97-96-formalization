/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RTransitionLiveSurface
import DoubleSurvivalBranchProducer

/-!
# Logical shape audit for the R-branch terminal

This scratch module records two exact facts needed when choosing the next R-branch
producer interface.

First, both current strict-surplus row-capture packets are already contradictory.
Consequently, adjoining either packet as a disjunct to an alternative proposition
does not weaken that alternative: `capture ∨ E` is equivalent to `E`.

Second, the checked critical-shell transition complement is unconditionally available.
Thus `capture ∨ currentComplement` is branch-complete but cannot close the branch,
because it reduces to the surviving complement itself.

No production module imports this file.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTargetShapeSkepticScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch
open ATailRTransitionLiveSurfaceScratch
open ATailForce.DoubleSurvivalBranchProducer

/-- The exact directed complement left by the current critical-shell interface. -/
def DirectedCriticalShellComplement
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) : Prop :=
  (P.y ∈
      (H.selectedAt P.x
        (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support ∧
    H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∉ S.surplusCap) ∨
  (P.y ∉
      (H.selectedAt P.x
        (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support ∧
    HasNEquidistantPointsAt 4 (D.A.erase P.y)
      (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1))

/-- The current critical-shell complement is a theorem, not an open producer. -/
theorem directedCriticalShellComplement
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    DirectedCriticalShellComplement P H :=
  AmbientRobustHistoryPair.sourceTransition_exact_split P H

/-- A pair-specific strict-surplus capture is propositionally equivalent to `False`.

This is only a logical-shape statement.  It does not say that producing the structured
packet is as difficult in practice as proving an unstructured contradiction. -/
theorem interiorSelectedRowCapturesPair_iff_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho} :
    Nonempty (InteriorSelectedRowCapturesPair P) ↔ False := by
  constructor
  · rintro ⟨L⟩
    exact false_of_interiorSelectedRowCapturesPair L
  · intro h
    exact h.elim

/-- Adding a contradictory pair-specific capture arm does not weaken an arbitrary
alternative proposition. -/
theorem interiorCapture_or_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    (E : Prop) :
    Nonempty (InteriorSelectedRowCapturesPair P) ∨ E ↔ E := by
  constructor
  · rintro (hCapture | hE)
    · exact (interiorSelectedRowCapturesPair_iff_false.mp hCapture).elim
    · exact hE
  · exact Or.inr

/-- In particular, adjoining row capture to the already-proved directed complement
produces a branch-complete statement but no contradiction. -/
theorem interiorCapture_or_currentComplement_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A} :
    Nonempty (InteriorSelectedRowCapturesPair P) ∨
        DirectedCriticalShellComplement P H ↔
      DirectedCriticalShellComplement P H :=
  interiorCapture_or_iff _

/-- A normal-form strict-surplus capture is also propositionally equivalent to `False`. -/
theorem nonempty_strictSurplusRowCapturesErasedPair_iff_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S r H}
    {N : DoubleSurvivalBranchNormalForm F} :
    Nonempty (StrictSurplusRowCapturesErasedPair N) ↔ False := by
  constructor
  · rintro ⟨L⟩
    exact false_of_strictSurplusRowCapturesErasedPair N L
  · intro h
    exact h.elim

/-- Adding the closure-facing capture arm does not weaken an arbitrary alternative.

Therefore an alternative is useful for closure only when it comes with its own checked
consumer to `False` (or a checked well-founded transition whose terminal consumers close).
A raw blocker edge does not meet that contract. -/
theorem strictCapture_or_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S r H}
    {N : DoubleSurvivalBranchNormalForm F}
    (E : Prop) :
    Nonempty (StrictSurplusRowCapturesErasedPair N) ∨ E ↔ E := by
  constructor
  · rintro (hCapture | hE)
    · exact
        (nonempty_strictSurplusRowCapturesErasedPair_iff_false.mp hCapture).elim
    · exact hE
  · exact Or.inr

/-- A disjunctive producer closes only after every alternative has a contradiction
consumer.  This is the exact acceptance condition for adding a new terminal arm. -/
theorem false_of_strictCapture_or_eliminableAlternative
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S r H}
    {N : DoubleSurvivalBranchNormalForm F}
    {E : Prop}
    (h : Nonempty (StrictSurplusRowCapturesErasedPair N) ∨ E)
    (false_of_E : E → False) : False := by
  rcases h with hCapture | hE
  · exact nonempty_strictSurplusRowCapturesErasedPair_iff_false.mp hCapture
  · exact false_of_E hE

#print axioms directedCriticalShellComplement
#print axioms interiorSelectedRowCapturesPair_iff_false
#print axioms interiorCapture_or_iff
#print axioms interiorCapture_or_currentComplement_iff
#print axioms nonempty_strictSurplusRowCapturesErasedPair_iff_false
#print axioms strictCapture_or_iff
#print axioms false_of_strictCapture_or_eliminableAlternative

end ATailRTargetShapeSkepticScratch
end Problem97
