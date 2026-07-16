/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RetainedPointProvenance
import ActualBlockerOmissionAdapter
import Erdos9796Proof.P97.U2.WitnessReflectionKernel

/-!
# Residual-terminal OMISSION consumer

After choosing the witnesses in `RetainedActualBlockerTerminalPayload`, the
residual-terminal OMISSION cell says that the actual blocker survives both
terminal deletions, lies on the terminal first-apex radius, and its source mate
is omitted from the actual critical shell.

The only producer field consumed here is the proposed terminal-pair support
bridge: the ambient robust radius is the terminal radius and both named
terminal points lie in the actual blocker shell.  The erased source `P.x` is
already in that shell.  Thus `P.x`, `q`, and `w` are three distinct common
points of the first-apex circle and the actual-blocker circle, contradicting
the banked two-circle endpoint theorem.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRTransitionLiveSurfaceScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

/-- The exact residual-terminal OMISSION projection obtained after choosing
`terminalRadius`, `q`, and `w` from
`RetainedActualBlockerTerminalPayload` and selecting that product cell. -/
def RetainedActualBlockerResidualTerminalOmissionCell
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (terminalRadius : ℝ) (q w : ℝ²) : Prop :=
  let hxA := (mem_selectedClass.mp P.x_mem_class).1
  let blocker := H.centerAt P.x hxA
  q ∈ (C.filter fun z => dist z S.oppApex1 = terminalRadius) \
      S.surplusCap ∧
    w ∈ (C.filter fun z => dist z S.oppApex1 = terminalRadius) \
      S.surplusCap ∧
    q ≠ w ∧
    blocker ∈ (C.erase q).erase w ∧
    blocker ∈ SelectedClass C S.oppApex1 terminalRadius ∧
    ActualBlockerOmissionOutcome P H

/-- The residual-terminal OMISSION cell closes once its two named terminal
points are produced in the actual blocker shell at the ambient robust radius.

The bridge is the sole additional producer hypothesis.  All three
distinctness facts used by the two-circle consumer come from the exact source:
`q ≠ w` is terminal-witness provenance, while `P.x` is erased and `q,w`
are retained by `C`. -/
theorem AmbientRobustHistoryPair.false_of_residualTerminalOmission_of_terminalPairSupportBridge
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho terminalRadius : ℝ} {q w : ℝ²}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (hcell : RetainedActualBlockerResidualTerminalOmissionCell
      P H terminalRadius q w)
    (hbridge :
      let hxA := (mem_selectedClass.mp P.x_mem_class).1
      let K := (H.selectedAt P.x hxA).toCriticalFourShell
      rho = terminalRadius ∧ q ∈ K.support ∧ w ∈ K.support) :
    False := by
  let hxA : P.x ∈ D.A := (mem_selectedClass.mp P.x_mem_class).1
  let blocker := H.centerAt P.x hxA
  let K := (H.selectedAt P.x hxA).toCriticalFourShell
  change
    q ∈ (C.filter fun z => dist z S.oppApex1 = terminalRadius) \
        S.surplusCap ∧
      w ∈ (C.filter fun z => dist z S.oppApex1 = terminalRadius) \
        S.surplusCap ∧
      q ≠ w ∧
      blocker ∈ (C.erase q).erase w ∧
      blocker ∈ SelectedClass C S.oppApex1 terminalRadius ∧
      ActualBlockerOmissionOutcome P H at hcell
  change rho = terminalRadius ∧ q ∈ K.support ∧ w ∈ K.support at hbridge
  rcases hcell with
    ⟨hqTerminal, hwTerminal, hqw, _hblockerResidual,
      _hblockerTerminal, homission⟩
  rcases hbridge with ⟨hrho, hqSupport, hwSupport⟩

  have hqC : q ∈ C :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hqTerminal).1).1
  have hwC : w ∈ C :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hwTerminal).1).1
  have hqFirst : dist q S.oppApex1 = rho := by
    exact
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hqTerminal).1).2 |>.trans
        hrho.symm
  have hwFirst : dist w S.oppApex1 = rho := by
    exact
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hwTerminal).1).2 |>.trans
        hrho.symm
  have hxFirst : dist P.x S.oppApex1 = rho := by
    simpa [dist_comm] using (mem_selectedClass.mp P.x_mem_class).2

  have hx_ne_q : P.x ≠ q := by
    intro hxq
    apply (Finset.mem_sdiff.mp P.x_mem_erased).2
    simpa [hxq] using hqC
  have hw_ne_x : w ≠ P.x := by
    intro hwx
    apply (Finset.mem_sdiff.mp P.x_mem_erased).2
    simpa [hwx] using hwC

  have hrow := ActualBlockerOmissionOutcome.exactRowPacket homission
  have hcircles :
      (⟨S.oppApex1, rho⟩ : Sphere ℝ²) ≠ ⟨blocker, hrow.radius⟩ := by
    intro hsame
    have hblocker_ne : blocker ≠ S.oppApex1 := by
      simpa [blocker, hxA] using
        AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1 P H
    exact hblocker_ne (congrArg Sphere.center hsame).symm

  have hw_eq_q : w = q :=
    two_circle_third_point_eq
      (a := S.oppApex1) (b := blocker)
      (p₁ := P.x) (p₂ := q) (w := w)
      (ra := rho) (rb := hrow.radius)
      hcircles hx_ne_q hxFirst hqFirst
      (by simpa [dist_comm] using hrow.source_eq_radius)
      (by simpa [dist_comm] using hrow.support_eq_radius q hqSupport)
      hwFirst
      (by simpa [dist_comm] using hrow.support_eq_radius w hwSupport)
      hw_ne_x
  exact hqw hw_eq_q.symm

#print axioms AmbientRobustHistoryPair.false_of_residualTerminalOmission_of_terminalPairSupportBridge

end ATailRFullParentEntryScratch
end Problem97
