/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.SharedFrontierHelpers

/-!
# B1 card-six physical-class ingress

This module packages the source proof that the physical apex lies outside its
positive-radius selected class.  Thus a card-six class together with that apex
has seven elements.  No local-role or completion-role packet is required.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace B1CardSixPhysicalIngress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
    (H := H) (F := F)}

/-- The physical apex does not lie in its positive-radius selected class. -/
theorem oppApex2_not_mem_selectedClass :
    S.oppApex2 ∉ SelectedClass D.A S.oppApex2 C.rho := by
  intro hapex
  have hrhoZero : C.rho = 0 := by
    have hdist := (mem_selectedClass.mp hapex).2
    simpa using hdist.symm
  exact (ne_of_gt C.hrho) hrhoZero

/-- A card-six physical class together with its physical apex has seven
elements.  This is the cardinality half of the physical `K7` used by the
finite alias screen; it imposes no condition on auxiliary completion roles. -/
theorem physicalClassWithApex_card_eq_seven
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6) :
    (insert S.oppApex2 (SelectedClass D.A S.oppApex2 C.rho)).card = 7 := by
  rw [Finset.card_insert_of_notMem oppApex2_not_mem_selectedClass, hsix]

end B1CardSixPhysicalIngress
end ATailFrontierLiveClosure
end Problem97
