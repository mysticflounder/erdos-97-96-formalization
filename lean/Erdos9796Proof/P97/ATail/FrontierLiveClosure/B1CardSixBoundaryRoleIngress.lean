/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1LocalRolePacket
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1WinningLiveSliceIngress

/-!
# B1 card-six boundary-role ingress

The card-six local packet names the two deleted points and both two-point live
slices.  The normal-form cover therefore identifies those six carrier labels
with the whole physical class.  Injectivity of a boundary indexing then
transfers the exact cardinality to their boundary indices.

This module records only the physical-class and boundary-index facts.  It does
not add cap placement, deletion survival, no-third provenance, or a terminal
negation.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace B1CardSixBoundaryRoleIngress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
    (H := H) (F := F)}

/-- The six named physical roles have precisely the values in the physical
second-apex class. -/
theorem physicalRowChoice_value_image_eq_physicalClass
    (P : B1CardSixLocalRolePacket C)
    (hnormal : B1PhysicalClassFiveSixNormalForm C) :
    Finset.image (pointOf (A := D.A)) P.physicalRowChoice.support =
      SelectedClass D.A S.oppApex2 C.rho := by
  classical
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let uSlice :=
    ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support ∩ physicalClass
  let vSlice :=
    ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support ∩ physicalClass
  have hcover :
      physicalClass =
        {C.first.deleted.1, C.second.deleted.1} ∪ (uSlice ∪ vSlice) := by
    simpa [B1PhysicalClassFiveSixNormalForm, physicalClass, uSlice, vSlice]
      using hnormal.2.2
  have huSlice :
      uSlice = {C.u.1, P.uPhysical.other.1} := by
    simpa [uSlice, physicalClass] using P.uPhysical.slice_eq
  have hvSlice :
      vSlice = {C.v.1, P.vPhysical.other.1} := by
    simpa [vSlice, physicalClass] using P.vPhysical.slice_eq
  change
    Finset.image (pointOf (A := D.A)) P.physicalRowChoice.support =
      physicalClass
  rw [hcover, huSlice, hvSlice]
  simp only [B1CardSixLocalRolePacket.physicalRowChoice,
    Finset.image_insert, Finset.image_singleton,
    B1CardSixLocalRolePacket.d1, B1CardSixLocalRolePacket.d2,
    B1CardSixLocalRolePacket.u0, B1CardSixLocalRolePacket.u1,
    B1CardSixLocalRolePacket.v0, B1CardSixLocalRolePacket.v1, pointOf]
  ext x
  simp only [Finset.mem_insert, Finset.mem_singleton, Finset.mem_union]
  tauto

/-- On the card-six branch, the named physical row choice has six carrier
labels. -/
theorem physicalRowChoice_support_card_eq_six
    (P : B1CardSixLocalRolePacket C)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6) :
    P.physicalRowChoice.support.card = 6 := by
  have himage :=
    physicalRowChoice_value_image_eq_physicalClass P hnormal
  calc
    P.physicalRowChoice.support.card =
        (Finset.image (pointOf (A := D.A))
          P.physicalRowChoice.support).card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ = (SelectedClass D.A S.oppApex2 C.rho).card :=
      congrArg Finset.card himage
    _ = 6 := hsix

/-- Every complete-carrier boundary indexing sends the six physical roles to
six distinct boundary indices. -/
theorem physicalRowChoice_boundaryIndex_image_card_eq_six
    (P : B1CardSixLocalRolePacket C)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6)
    (E : B1EscapeRowProvenanceStar C) :
    (Finset.image E.boundary.indexOf P.physicalRowChoice.support).card = 6 := by
  rw [Finset.card_image_of_injective _ E.boundary.index_injective,
    physicalRowChoice_support_card_eq_six P hnormal hsix]

end B1CardSixBoundaryRoleIngress
end ATailFrontierLiveClosure
end Problem97
