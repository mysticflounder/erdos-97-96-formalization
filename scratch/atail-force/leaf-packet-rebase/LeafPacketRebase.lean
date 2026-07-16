/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# Rebase `CounterexampleData` onto the parent leaf packet

Several scratch continuation classifiers are stated using the distinguished
`D.packet`, while the production parent deliberately works with the CP-built
`leafSurplusPacket`.  The two packets must not be identified.  Instead, the
same carrier, convexity, and global-K4 data can be bundled with the leaf packet
as a new `CounterexampleData`.

This file checks that the rebasing is definitionally transparent for every
packet-independent object used by the joint-transition classifiers, including
selected rows and the retained critical-shell system.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLeafPacketRebaseScratch

/-- Replace only the distinguished surplus packet.  The carrier and all of
its global hypotheses are unchanged. -/
def withPacket (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    CounterexampleData where
  A := D.A
  nonempty := D.nonempty
  convex := D.convex
  K4 := D.K4
  packet := S

@[simp] theorem withPacket_A
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    (withPacket D S).A = D.A := rfl

@[simp] theorem withPacket_packet
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    (withPacket D S).packet = S := rfl

@[simp] theorem withPacket_nonempty
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    (withPacket D S).nonempty = D.nonempty := rfl

@[simp] theorem withPacket_convex
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    (withPacket D S).convex = D.convex := rfl

@[simp] theorem withPacket_K4
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    (withPacket D S).K4 = D.K4 := rfl

/-- A row over the parent carrier is definitionally a row over the rebased
datum.  Its center may use the replacement packet. -/
def selectedFourClass_at_rebased_oppApex2
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (K : SelectedFourClass D.A S.oppApex2) :
    SelectedFourClass (withPacket D S).A
      (withPacket D S).packet.oppApex2 :=
  K

/-- The concrete parent critical map is preserved, not reconstructed or
reselected, by packet rebasing. -/
def criticalShellSystem_at_rebased_carrier
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) :
    CriticalShellSystem (withPacket D S).A :=
  H

#print axioms selectedFourClass_at_rebased_oppApex2
#print axioms criticalShellSystem_at_rebased_carrier

end ATailLeafPacketRebaseScratch
end Problem97
