/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardFiveLocalRolePacket
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1WinningLiveSliceIngress

/-!
# B1 five/six wave ingress

This module packages the source-produced escape-row witness together with the
cardinality-specific local role packet.  It is a producer for later consumers:
it does not assert a contradiction, a boundary order, or any extra
distinctness among the named roles.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier

/-- The source-faithful cardinality case for a B1 five/six normal form. -/
inductive B1FiveSixWaveCardCase
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Type
  | cardFive (packet : B1CardFiveLocalRolePacket C)
  | cardSix (packet : B1CardSixLocalRolePacket C)

/-- Combined source ingress for the B1 five/six normal-form wave. -/
structure B1FiveSixWaveIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) where
  escape : B1EscapeRowProvenanceStar C
  cardCase : B1FiveSixWaveCardCase C

/-- Every B1 five/six normal form supplies the combined source ingress.

This producer packages only the existing escape-row and local role producers.
It makes no boundary-order or contradiction claim. -/
theorem nonempty_b1FiveSixWaveIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C) :
    Nonempty (B1FiveSixWaveIngress C) := by
  classical
  obtain ⟨escape⟩ := nonempty_b1EscapeRowProvenanceStar C hnormal
  have hcard :
      (SelectedClass D.A S.oppApex2 C.rho).card = 5 ∨
        (SelectedClass D.A S.oppApex2 C.rho).card = 6 :=
    hnormal.2.1
  rcases hcard with hfive | hsix
  · obtain ⟨packet⟩ := nonempty_b1CardFiveLocalRolePacket C hnormal hfive
    exact ⟨{ escape := escape, cardCase := .cardFive packet }⟩
  · obtain ⟨packet⟩ := nonempty_b1CardSixLocalRolePacket C hnormal hsix
    exact ⟨{ escape := escape, cardCase := .cardSix packet }⟩

end ATailFrontierLiveClosure
end Problem97
