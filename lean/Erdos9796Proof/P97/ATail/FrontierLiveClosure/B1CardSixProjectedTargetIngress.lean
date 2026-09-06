/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardSixProjectedPointConfiguration
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardSixRawOrderIngress

/-!
# B1 card-six projected target ingress

This module names the raw card-six obstruction on the alias-collapsed
projected boundary and transports it to the promoted raw-order consumer.
The projected configuration remains a geometric carrier adapter; no PIQD
closure or order-cell coverage is asserted here.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace B1CardSixProjectedTargetIngress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open B1CardSixPointConfigurationIngress
open B1CardSixRawOrderIngress
open B1CardSixProjectedPointConfiguration
open Census554.GeneralCarrierBridge
open GenericRowNogoodCertificate

attribute [local instance] Classical.propDecidable

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
    (H := H) (F := F)}

/-- The card-six bad predicate on projected role labels over an ambient boundary. -/
def projectedRawCardSixBad
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A) : Prop :=
  ¬ ((SurplusCOMPGBank.btw
        (projectedLabelIndex P B (projectedRoleLabel P .physicalApex))
        (projectedLabelIndex P B (projectedRoleLabel P .Bu))
        (projectedLabelIndex P B (projectedRoleLabel P .u0)) ↔
      SurplusCOMPGBank.btw
        (projectedLabelIndex P B (projectedRoleLabel P .physicalApex))
        (projectedLabelIndex P B (projectedRoleLabel P .Bu))
        (projectedLabelIndex P B (projectedRoleLabel P .u1))) ∧
    (SurplusCOMPGBank.btw
        (projectedLabelIndex P B (projectedRoleLabel P .physicalApex))
        (projectedLabelIndex P B (projectedRoleLabel P .Bv))
        (projectedLabelIndex P B (projectedRoleLabel P .v0)) ↔
      SurplusCOMPGBank.btw
        (projectedLabelIndex P B (projectedRoleLabel P .physicalApex))
        (projectedLabelIndex P B (projectedRoleLabel P .Bv))
        (projectedLabelIndex P B (projectedRoleLabel P .v1))))

theorem projectedRawCardSixBad_iff_raw
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A) :
    projectedRawCardSixBad P B ↔
      RawCardSixBad
        (B1CardSixRawOrderIngress.roleIndex P B .physicalApex)
        (B1CardSixRawOrderIngress.roleIndex P B .Bu)
        (B1CardSixRawOrderIngress.roleIndex P B .Bv)
        (B1CardSixRawOrderIngress.roleIndex P B .u0)
        (B1CardSixRawOrderIngress.roleIndex P B .u1)
        (B1CardSixRawOrderIngress.roleIndex P B .v0)
        (B1CardSixRawOrderIngress.roleIndex P B .v1) := by
  simp only [projectedRawCardSixBad, RawCardSixBad, projectedLabelIndex,
    projectedRoleLabel, B1CardSixRawOrderIngress.roleLabel,
    B1CardSixRawOrderIngress.roleIndex,
    B1CardSixProjectedPointConfiguration.roleIndex]

/-- The projected negation is consumed by the promoted raw-order contradiction. -/
theorem false_of_b1PhysicalClassFiveSixNormalForm_of_not_projectedRawCardSixBad
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (hgood : ¬ projectedRawCardSixBad P B) : False := by
  apply false_of_b1PhysicalClassFiveSixNormalForm_of_not_rawCardSixBad C hnormal P B
  intro hraw
  apply hgood
  rw [projectedRawCardSixBad_iff_raw P B]
  exact hraw

/-- Delegate the six-point lower bound to the projected configuration ingress. -/
theorem roleCarrier_card_ge_six
    (P : B1CardSixLocalRolePacket C)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6) :
    6 ≤ (roleCarrier P).card :=
  B1CardSixProjectedPointConfiguration.roleCarrier_card_ge_six P hnormal hsix

end B1CardSixProjectedTargetIngress
end ATailFrontierLiveClosure
end Problem97
